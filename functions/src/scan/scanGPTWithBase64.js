const { onCall, HttpsError } = require("firebase-functions/v2/https");
const { OpenAI } = require("openai");
const sharp = require("sharp");
const { db } = require("../common/admin");
const { FieldValue } = require("firebase-admin/firestore");
const { algoliasearch } = require("algoliasearch");

let openai;
let algoliaClient;

// Xác định môi trường dựa vào FLAVOR hoặc project
const IS_PROD = process.env.FLAVOR === "prod";
const ALGOLIA_APP_ID_SECRET = IS_PROD
  ? "ALGOLIA_APP_ID_PROD"
  : "ALGOLIA_APP_ID_DEV";
const ALGOLIA_ADMIN_KEY_SECRET = IS_PROD
  ? "ALGOLIA_ADMIN_KEY_PROD"
  : "ALGOLIA_ADMIN_KEY_DEV";
const ALGOLIA_INDEX_NAME = IS_PROD ? "ingredients_prod" : "ingredients_dev";
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
  {
    region: "asia-southeast1",
    secrets: [
      "OPENAI_API_KEY",
      ALGOLIA_APP_ID_SECRET,
      ALGOLIA_ADMIN_KEY_SECRET,
    ],
  },
  async (request) => {
    if (!openai) {
      openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });
    }

    if (!algoliaClient) {
      const appId = process.env[ALGOLIA_APP_ID_SECRET];
      const adminKey = process.env[ALGOLIA_ADMIN_KEY_SECRET];

      if (!appId || !adminKey) {
        throw new HttpsError(
          "internal",
          `Algolia credentials chưa được cấu hình cho môi trường ${IS_PROD ? "prod" : "dev"}.`
        );
      }

      algoliaClient = algoliasearch(appId.trim(), adminKey.trim());
    }

    const { imageBase64, scanType } = request.data;

    if (!imageBase64) {
      throw new HttpsError("invalid-argument", "Cần có dữ liệu ảnh base64");
    }

    if (!scanType || (scanType !== "dish" && scanType !== "ingredients")) {
      throw new HttpsError(
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
        prompt = `Phân tích ảnh này và liệt kê tất cả các nguyên liệu/thực phẩm có thể nhìn thấy. Trả về dưới dạng một mảng JSON chứa tên các nguyên liệu bằng tiếng Việt.
        Ví dụ:
        {
          "ingredients": ["cà chua", "thịt bò", "hành tây"]
        }
        Chỉ trả về JSON, không bao gồm khối mã Markdown hay bất kỳ lời giải thích nào.`;
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

      console.log("GPT Response After Parsed:", result);

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

        console.log(FieldValue.serverTimestamp());

        result.id = newRecipeRef.id;
        result.createdAt = FieldValue.serverTimestamp();
        result.source = "scanned";
        result.isUserFavorite = false;

        const batch = db.batch();
        batch.set(newRecipeRef, result);
        batch.set(db.collection("recipe_cache").doc(pHash), {
          recipeId: newRecipeRef.id,
          createdAt: FieldValue.serverTimestamp(),
        });
        await batch.commit();

        console.log(
          `Saved new recipe ${newRecipeRef.id} and cached with pHash ${pHash}`
        );
        const finalDoc = await newRecipeRef.get();
        return finalDoc.data();
      } else if (scanType === "ingredients") {
        const ingredientNames = result.ingredients || [];
        console.log("All ingredients: ", ingredientNames);

        if (ingredientNames.length === 0) {
          return { ingredients: [] };
        }

        const requests = ingredientNames.map((name) => ({
          indexName: ALGOLIA_INDEX_NAME,
          query: name,
          params: {
            hitsPerPage: 1,
          },
        }));

        const { results: searchResults } = await algoliaClient.search(requests);

        const matchedIngredients = [];
        const unmatchedNames = [];

        searchResults.forEach((res, i) => {
          if (res.hits.length > 0) {
            matchedIngredients.push(res.hits[0]);
          } else {
            unmatchedNames.push(ingredientNames[i]);
          }
        });

        if (unmatchedNames.length > 0) {
          const logRef = db.collection("unmatched_scan_logs").doc();
          logRef.set({
            names: unmatchedNames,
            createdAt: FieldValue.serverTimestamp(),
          });
        }

        // Trả về danh sách các Ingredient object hoàn chỉnh
        return { ingredients: matchedIngredients };
      }
    } catch (error) {
      console.error("Lỗi trong hàm scanGPT:", error);
      throw new HttpsError("internal", "Lỗi GPT: " + error.message);
    }
  }
);
