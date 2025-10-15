// Import functions từ các file - họ đã được config với region asia-southeast1
const { createUserWithProfile } = require("./src/auth/createUserWithProfile");
const { backfillUsersHttp } = require("./src/maintenance/backfillUsersHttp");
const { optimizeImagesHttp } = require("./src/maintenance/optimizeImagesHttp");
const { scanGPTWithBase64 } = require("./src/scan/scanGPTWithBase64");

// Export functions - Algolia sync được xử lý bởi Extension
exports.createUserWithProfile = createUserWithProfile;
exports.backfillUsersHttp = backfillUsersHttp;
exports.optimizeImagesHttp = optimizeImagesHttp;
exports.scanGPTWithBase64 = scanGPTWithBase64;
