const { FieldValue } = require("firebase-admin/firestore");

/**
 * Đây là nguồn chân lý duy nhất định nghĩa cấu trúc của một user profile.
 * @param {string} uid UID của người dùng.
 * @param {string} username Tên người dùng.
 * @param {string} email Email của người dùng.
 * @return {object} Một object chứa đầy đủ dữ liệu cho một user profile.
 */
const getUserProfileData = (uid, username, email) => {
  return {
    uid: uid,
    username: username,
    email: email,
    photoURL: "",
    createdAt: FieldValue.serverTimestamp(),
  };
};

module.exports = { getUserProfileData };
