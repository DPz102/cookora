// index.js: File điều phối, chịu trách nhiệm tải và export các cloud functions.

// Tải functions đăng ký từ file tương ứng
const { createUserWithProfile } = require("./src/auth/createUserWithProfile");
const { backfillUsersHttp } = require("./src/maintenance/backfillUsersHttp");
const { optimizeImagesHttp } = require("./src/maintenance/optimizeImagesHttp");
const { scanGPTWithBase64 } = require("./src/scan/scanGPTWithBase64");

// Export function để Firebase có thể nhận diện và triển khai
exports.createUserWithProfile = createUserWithProfile;
exports.backfillUsersHttp = backfillUsersHttp;
exports.optimizeImagesHttp = optimizeImagesHttp;
exports.scanGPTWithBase64 = scanGPTWithBase64;
