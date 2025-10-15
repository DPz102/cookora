// createUserWithProfile.js: Chịu trách nhiệm cho toàn bộ quy trình đăng ký người dùng mới.
const { onCall, HttpsError } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Tải các dịch vụ (db, auth) đã được khởi tạo từ file common/admin.js
const { db, auth } = require("../common/admin");
const { getUserProfileData } = require("../common/userSchema");

/**
 * Hàm xử lý quy trình đăng ký người dùng mới.
 * - Đồng bộ logic validation với client (core/utils/validators.dart).
 * - Tạo tài khoản trong Firebase Authentication.
 * - Tạo profile user trong Firestore bằng Batch Write.
 * - Tự động rollback (xóa user Auth) nếu quá trình tạo profile Firestore thất bại.
 */
/**
 * Validates user input for registration.
 * @param {string} email The user's email.
 * @param {string} password The user's password.
 * @param {string} username The user's chosen username.
 * @return {string} The trimmed and validated username.
 */
const validateInput = (email, password, username) => {
  // Kiểm tra các trường cơ bản
  if (!email || !password || !username) {
    throw new HttpsError("invalid-argument");
  }
  if (password.length < 6) {
    throw new HttpsError("invalid-argument");
  }

  const trimmedUsername = username.trim();
  if (trimmedUsername.length < 3 || trimmedUsername.length > 20) {
    throw new HttpsError("invalid-argument");
  }
  const usernameRegex = /^[a-zA-Z0-9_.]+$/;
  if (!usernameRegex.test(trimmedUsername)) {
    throw new HttpsError("invalid-argument");
  }
  if (
    trimmedUsername.startsWith(".") ||
    trimmedUsername.startsWith("_") ||
    trimmedUsername.endsWith(".") ||
    trimmedUsername.endsWith("_")
  ) {
    throw new HttpsError("invalid-argument");
  }

  return trimmedUsername;
};

const createUserWithProfile = onCall(
  {
    region: "asia-southeast1",
    enforceAppCheck: true,
    secrets: [],
  },
  async (request) => {
    // 1. Lấy và xác thực dữ liệu đầu vào
    const { email, password, username } = request.data;
    const validUsername = validateInput(email, password, username);

    let userRecord = null;

    try {
      // 2. Tạo người dùng trong Firebase Authentication
      userRecord = await auth.createUser({
        email: email,
        password: password,
        displayName: validUsername,
      });

      // 3. Chuẩn bị dữ liệu để ghi vào Firestore
      const userProfileData = getUserProfileData(
        userRecord.uid,
        validUsername,
        email
      );

      // 4. Ghi dữ liệu vào Firestore
      await db.collection("users").doc(userRecord.uid).set(userProfileData);

      return; // Thành công
    } catch (e) {
      logger.error("Đã xảy ra lỗi trong quá trình đăng ký:", e);

      if (userRecord) {
        logger.warn("Rollback: Đang xóa user Auth do lỗi.");
        await auth.deleteUser(userRecord.uid);
      }

      if (e.code === "auth/email-already-exists") {
        throw new HttpsError("already-exists");
      }

      throw e;
    }
  }
);

// Export function để file index.js có thể sử dụng
module.exports = { createUserWithProfile };
