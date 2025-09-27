import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ImageProcessor {
  static Future<File> processImage({
    required File imageFile,
    int maxWidth = 1080,
    int quality = 85,
  }) async {
    // Lấy đường dẫn thư mục tạm thời của ứng dụng
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;

    // Tạo tên file mới để tránh ghi đè
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final outPath = path.join(tempPath, 'optimized_$timestamp.jpg');

    // Nén và thay đổi kích thước ảnh
    final XFile? result = await FlutterImageCompress.compressAndGetFile(
      imageFile.absolute.path,
      outPath,
      quality: quality,
      minWidth: maxWidth,
    );

    if (result == null) {
      return imageFile;
    }

    return File(result.path);
  }
}
