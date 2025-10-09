// admin.js: Khởi tạo Firebase Admin SDK và export các dịch vụ cần thiết.
const { initializeApp } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");
const { getAuth } = require("firebase-admin/auth");
const { getStorage } = require("firebase-admin/storage");

// Khởi tạo app một lần duy nhất
initializeApp();

// Lấy reference tới các dịch vụ
const db = getFirestore();
const auth = getAuth();
const storage = getStorage();

// Export chúng ra để các file khác có thể sử dụng
module.exports = { db, auth, storage };
