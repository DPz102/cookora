const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const { getFirestore } = require("firebase-admin/firestore");
const { getStorage } = require("firebase-admin/storage");
const path = require("path");
const os = require("os");
const fs = require("fs").promises;
const sharp = require("sharp");
const { v4: uuidv4 } = require("uuid");

/**
 * Cloud Function này thực hiện 2 việc cùng lúc:
 * 1. Tối ưu hóa các ảnh chưa được tối ưu.
 * 2. Sửa chữa các URL bị hỏng trong Firestore bằng cách tạo token mới và cập nhật lại.
 */
const optimizeImagesHttp = onRequest(
  {
    region: "asia-southeast1",
    timeoutSeconds: 540,
    memory: "1GB",
    secrets: ["MAINTENANCE_SECRET_KEY"],
  },
  async (req, res) => {
    const { type, secret } = req.query;

    if (secret !== process.env.MAINTENANCE_SECRET_KEY) {
      logger.error("Unauthorized access attempt");
      return res.status(401).send("Unauthorized");
    }

    if (!type || (type !== "posts" && type !== "users")) {
      return res
        .status(400)
        .send("Bad Request: Use 'type=posts' or 'type=users'.");
    }

    const db = getFirestore();
    const bucket = getStorage().bucket();
    let processedCount = 0;

    const config = {
      users: {
        prefix: "user_avatars/",
        maxWidth: 400,
        quality: 80,
        collection: "users",
        field: "photoURL",
      },
      posts: {
        prefix: "posts/",
        maxWidth: 1080,
        quality: 85,
        collection: "posts",
        field: "imageUrl",
      },
    };

    const { prefix, maxWidth, quality, collection, field } = config[type];

    try {
      const [files] = await bucket.getFiles({ prefix });
      logger.info(
        `Starting process for '${type}'. Found ${files.length} files.`
      );

      for (const file of files) {
        if (file.name.endsWith("/")) continue;

        const tempFilePath = path.join(os.tmpdir(), path.basename(file.name));

        try {
          await file.download({ destination: tempFilePath });

          const optimizedBuffer = await sharp(tempFilePath)
            .resize({ width: maxWidth, withoutEnlargement: true })
            .jpeg({ quality: quality, progressive: false })
            .toBuffer();

          // 1. Tạo một token hoàn toàn mới
          const newToken = uuidv4();

          // 2. Ghi đè file với buffer mới VÀ gán token mới vào metadata
          await file.save(optimizedBuffer, {
            metadata: {
              contentType: "image/jpeg",
              metadata: {
                optimized: "true", // Đánh dấu đã tối ưu
                firebaseStorageDownloadTokens: newToken,
              },
            },
          });

          // 3. Tạo URL download mới từ token mới
          const bucketName = file.bucket.name;
          const fileName = encodeURIComponent(file.name);
          const newUrl = `https://firebasestorage.googleapis.com/v0/b/${bucketName}/o/${fileName}?alt=media&token=${newToken}`;

          // 4. Lấy ID của document và cập nhật URL mới vào Firestore
          const docId = path.basename(file.name, path.extname(file.name));
          const docRef = db.collection(collection).doc(docId);
          await docRef.update({ [field]: newUrl });

          processedCount++;
          logger.info(`Processed and updated Firestore for: ${file.name}`);
        } catch (error) {
          logger.error(`Failed to process file ${file.name}:`, error);
        } finally {
          await fs.unlink(tempFilePath).catch(() => {});
        }
      }

      const message = `Process complete for '${type}'. Processed ${processedCount} files.`;
      logger.info(message);
      res.status(200).send(message);
    } catch (error) {
      logger.error(`Error listing files for prefix '${prefix}':`, error);
      res.status(500).send("Internal Server Error");
    }
  }
);

module.exports = { optimizeImagesHttp };
