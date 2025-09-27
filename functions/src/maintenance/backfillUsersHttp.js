// src/maintenance/backfillUsersHttp.js
const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const { db } = require("../common/admin");
const { FieldValue } = require("firebase-admin/firestore");
const { getUserProfileData } = require("../common/userSchema"); // schema chuẩn

const backfillUsersHttp = onRequest(
  { secrets: ["MAINTENANCE_SECRET_KEY"] },
  async (req, res) => {
    if (req.query.key !== process.env.MAINTENANCE_SECRET_KEY) {
      res.status(403).send("Forbidden: Invalid secret key.");
      return;
    }

    logger.info(
      "Bắt đầu quá trình backfill thông minh (kèm xử lý createdAt)..."
    );

    try {
      const usersRef = db.collection("users");
      const snapshot = await usersRef.get();
      if (snapshot.empty) {
        res.status(200).send("Không có user nào để xử lý.");
        return;
      }

      const batches = [];
      let currentBatch = db.batch();
      let writeCount = 0;
      let updatedUserCount = 0;

      snapshot.forEach((doc) => {
        const docData = doc.data();

        // 1) Build profile "chuẩn" theo cùng schema dùng khi tạo user mới
        const template = getUserProfileData(
          doc.id,
          docData.username,
          docData.email
        );

        const updates = {};
        let needsUpdate = false;

        // 2) Backfill các field bị thiếu (TRỪ createdAt, xử lý riêng)
        for (const [key, value] of Object.entries(template)) {
          if (key === "createdAt") continue; // xử lý ở bước 3
          if (docData[key] === undefined) {
            updates[key] = value;
            needsUpdate = true;
          }
        }

        // 3) Xử lý createdAt: chỉ set khi THIẾU
        //    - Ưu tiên doc.createTime (thời điểm doc được tạo trong Firestore)
        //    - Fallback: FieldValue.serverTimestamp()
        if (docData.createdAt === undefined) {
          updates.createdAt = doc.createTime || FieldValue.serverTimestamp();
          needsUpdate = true;
        }

        // 4) Nếu có cập nhật → gom vào batch
        if (needsUpdate) {
          logger.info(
            `User ${doc.id} cần cập nhật các trường: ${Object.keys(
              updates
            ).join(", ")}`
          );
          currentBatch.update(doc.ref, updates);
          writeCount++;
          updatedUserCount++;

          // Giới hạn 500 write/ batch (an toàn dùng 499)
          if (writeCount >= 499) {
            batches.push(currentBatch);
            currentBatch = db.batch();
            writeCount = 0;
          }
        }
      });

      if (writeCount > 0) {
        batches.push(currentBatch);
      }

      if (batches.length > 0) {
        await Promise.all(batches.map((batch) => batch.commit()));
        const message = `✅ Backfill thành công! Đã cập nhật ${updatedUserCount} user (đã xử lý createdAt khi thiếu).`;
        logger.info(message);
        res.status(200).send(message);
      } else {
        const message = "✅ Không có user nào cần cập nhật. Mọi thứ đã chuẩn!";
        logger.info(message);
        res.status(200).send(message);
      }
    } catch (error) {
      logger.error("❌ Quá trình backfill đã xảy ra lỗi:", error);
      res
        .status(500)
        .send("Internal Server Error. Kiểm tra logs để biết chi tiết.");
    }
  }
);

module.exports = { backfillUsersHttp };
