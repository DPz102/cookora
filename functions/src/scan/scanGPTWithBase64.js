const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { onCall, HttpsError } = require("firebase-functions/v2/https");
const { OpenAI } = require("openai");
const sharp = require("sharp");
const { db } = require("../common/admin");

let openai;
/**
 * Calculates the Perceptual Hash (pHash) for a base64 encoded image.
 * @param {string} imageBase64 The base64 encoded image string.
 * @return {Promise<string>} A promise that resolves to the pHash hex string.
 */
async function calculatePHash(imageBase64) {
  try {
    const imageBuffer = Buffer.from(imageBase64, "base64");
    // pHash() trả về một buffer, chúng ta chuyển nó thành chuỗi hex để lưu trữ
    // Đây là một cách triển khai pHash đơn giản bằng cách resize và lấy pixel data
    const pHashBuffer = await sharp(imageBuffer)
      .grayscale()
      .resize(8, 8, { fit: "fill" })
      .raw()
      .toBuffer();
    return pHashBuffer.toString("hex");
  } catch (error) {
    console.error("Lỗi tính toán pHash:", error);
    // Trả về một giá trị không thể dùng làm key để tránh cache sai
    return `error-${Date.now()}`;
  }
}

exports.scanGPTWithBase64 = onCall(
  { secrets: ["OPENAI_API_KEY"] },
  async (request) => {
    if (!openai) {
      openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });
    }

    const { imageBase64, scanType } = request.data;

    if (!imageBase64) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Cần có dữ liệu ảnh base64"
      );
    }

    if (!scanType || (scanType !== "dish" && scanType !== "ingredients")) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        `scanType phải là "dish" hoặc "ingredients"`
      );
    }

    try {
      // Tính pHash và kiểm tra cache (chỉ áp dụng cho 'dish')
      if (scanType === "dish") {
        const pHash = await calculatePHash(imageBase64);
        const cacheRef = db.collection("recipe_cache").doc(pHash);
        const cacheDoc = await cacheRef.get();

        if (cacheDoc.exists) {
          const { recipeId } = cacheDoc.data();
          if (recipeId) {
            const recipeDoc = await db
              .collection("recipes")
              .doc(recipeId)
              .get();
            if (recipeDoc.exists) {
              console.log(
                `Cache hit for pHash: ${pHash}. Returning recipeId: ${recipeId}`
              );
              return recipeDoc.data();
            }
          }
        }
        console.log(`Cache miss for pHash: ${pHash}. Calling GPT API...`);
      }

      let prompt;

      if (scanType === "dish") {
        prompt = `Phân tích ảnh này và trả về thông tin món ăn dưới dạng JSON với format:
{
  "id": "",
  "name": "tên món ăn bằng tiếng Việt",
  "description": "mô tả ngắn gọn về món ăn",
  "requiredIngredients": ["nguyên liệu 1", "nguyên liệu 2"],
  "optionalIngredients": ["nguyên liệu tùy chọn 1", "nguyên liệu tùy chọn 2"],
  "instructions": ["bước 1: chi tiết", "bước 2: chi tiết"],
  "source": "scanned",
  "servingSize": số người ăn (mặc định: 2),
  "cookTimeInMinutes": thời gian nấu tính bằng phút,
  "difficulty": "Dễ/Trung bình/Khó"
}

Chỉ trả về JSON, không bao gồm khối mã Markdown hay bất kỳ lời giải thích nào. Phải bao gồm đầy đủ các trường, đặc biệt là requiredIngredients, optionalIngredients và instructions.`;
      } else {
        prompt = `Phân tích ảnh này và liệt kê tất cả các nguyên liệu/thực phẩm có thể nhìn thấy. Trả về dưới dạng JSON:
{
  "ingredients": [
    {
      "id": "",
      "uid": "",
      "name": "tên nguyên liệu bằng tiếng Việt",
      "quantity": 0,
      "unit": "đơn vị đo lường phù hợp",
      "confidence": số từ 0-1 (độ tin cậy)
    }
  ]
}

Chỉ trả về JSON, không bao gồm khối mã Markdown hay bất kỳ lời giải thích nào. Nếu không chắc chắn về quantity hoặc unit, hãy đưa ra ước lượng hợp lý hoặc để giá trị mặc định.`;
      }

      const response = await openai.chat.completions.create({
        model: "gpt-4o",
        messages: [
          {
            role: "user",
            content: [
              { type: "text", text: prompt },
              {
                type: "image_url",
                image_url: { url: `data:image/jpeg;base64,${imageBase64}` },
              },
            ],
          },
        ],
        max_tokens: 1000,
        temperature: 0.3,
      });

      const content = response.choices[0].message.content;
      console.log("GPT Response:", content);

      // Tìm vị trí của dấu { đầu tiên và dấu } cuối cùng
      const firstBrace = content.indexOf("{");
      const lastBrace = content.lastIndexOf("}");

      if (firstBrace === -1 || lastBrace === -1 || lastBrace < firstBrace) {
        console.error("Không tìm thấy đối tượng JSON hợp lệ trong phản hồi.");
        throw new HttpsError("internal", "Phản hồi từ GPT không chứa JSON.");
      }

      // Trích xuất chuỗi JSON thuần túy
      const jsonString = content.substring(firstBrace, lastBrace + 1);

      let result;
      try {
        result = JSON.parse(jsonString);
      } catch (jsonError) {
        console.error("Lỗi phân tích JSON:", jsonError);
        throw new HttpsError(
          "internal",
          "Phản hồi từ GPT không phải là JSON hợp lệ."
        );
      }

      // Lưu kết quả vào CACHE và RECIPES
      if (scanType === "dish") {
        // Kiểm tra công thức có hợp lệ không
        const recipeName = result.name ? result.name.trim() : "";
        const hasRequiredIngredients =
          Array.isArray(result.requiredIngredients) &&
          result.requiredIngredients.length > 0;

        if (recipeName === "" || !hasRequiredIngredients) {
          console.log(
            "Phản hồi của GPT không hợp lệ, không tiến hành lưu công thức"
          );
          return result;
        }

        const pHash = await calculatePHash(imageBase64);
        const newRecipeRef = db.collection("recipes").doc();

        console.log(admin.firestore.FieldValue.serverTimestamp());

        result.id = newRecipeRef.id;
        result.createdAt = admin.firestore.FieldValue.serverTimestamp();
        result.source = "scanned";
        result.isUserFavorite = false;

        const batch = db.batch();
        batch.set(newRecipeRef, result);
        batch.set(db.collection("recipe_cache").doc(pHash), {
          recipeId: newRecipeRef.id,
          createdAt: admin.firestore.FieldValue.serverTimestamp(),
        });
        await batch.commit();

        console.log(
          `Saved new recipe ${newRecipeRef.id} and cached with pHash ${pHash}`
        );
        const finalDoc = await newRecipeRef.get();
        return finalDoc.data();
      }

      return result;
    } catch (error) {
      console.error("Lỗi trong hàm scanGPT:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Lỗi GPT: " + error.message
      );
    }
  }
);
