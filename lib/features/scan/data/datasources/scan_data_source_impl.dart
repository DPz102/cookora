import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:image/image.dart' as img;

import 'package:cookora/features/scan/data/datasources/scan_data_source.dart';

class ScanDataSourceImpl implements ScanDataSource {
  final FirebaseFunctions _functions;
  final Uuid _uuid = Uuid();

  ScanDataSourceImpl({required FirebaseFunctions functions})
    : _functions = functions;

  // Kích thước tối đa cho ảnh
  static const int maxDimension = 800;
  // Chất lượng JPEG
  static const int jpegQuality = 70;

  // Hàm xử lý và tối ưu ảnh trước khi gửi lên API
  Future<Uint8List> _optimizeImageBytes(File imageFile) async {
    //Đọc và decode ảnh
    final bytes = await imageFile.readAsBytes();
    final originalImage = img.decodeImage(bytes);

    if (originalImage == null) {
      return bytes; // Trả về bytes gốc nếu không decode được
    }

    int targetWidth, targetHeight;

    // Chọn chiều nào lớn hơn để giảm kích thước tối đa xuống mà không làm vỡ tỷ lệ ảnh
    if (originalImage.width > originalImage.height) {
      targetWidth = maxDimension;
      targetHeight = (originalImage.height * targetWidth / originalImage.width)
          .round();
    } else {
      targetHeight = maxDimension;
      targetWidth = (originalImage.width * targetHeight / originalImage.height)
          .round();
    }

    // Resize ảnh
    final resizedImage = img.copyResize(
      originalImage,
      width: targetWidth,
      height: targetHeight,
      interpolation: img.Interpolation.average,
    );

    // Nén ảnh với chất lượng định sẵn
    final compressedBytes = img.encodeJpg(resizedImage, quality: jpegQuality);

    return compressedBytes;
  }

  // Hàm helper để chuyển đổi Map<Object?, Object?> thành Map<String, dynamic>
  Map<String, dynamic> _convertMap(Map<dynamic, dynamic> map) {
    return map.map<String, dynamic>((key, value) {
      if (value is Map) {
        return MapEntry(key.toString(), _convertMap(value));
      } else if (value is List) {
        return MapEntry(key.toString(), _convertList(value));
      } else {
        return MapEntry(key.toString(), value);
      }
    });
  }

  // Hàm helper để chuyển đổi List<dynamic>
  List<dynamic> _convertList(List<dynamic> list) {
    return list.map((item) {
      if (item is Map) {
        return _convertMap(item);
      } else if (item is List) {
        return _convertList(item);
      } else {
        return item;
      }
    }).toList();
  }

  // Hàm dịch timestamp từ cloud functions
  Map<String, dynamic> _reconstructTimestamp(Map<String, dynamic> data) {
    if (data['createdAt'] is Map) {
      final map = data['createdAt'] as Map;
      // Kiểm tra chắc chắn nó có đúng là timestamp bị lỗi không
      if (map.containsKey('_seconds') && map.containsKey('_nanoseconds')) {
        final int seconds = map['_seconds'];
        final int nanoseconds = map['_nanoseconds'];
        // Dựng lại đối tượng Timestamp chuẩn của Dart
        data['createdAt'] = Timestamp(seconds, nanoseconds);
      }
    }
    return data;
  }

  Future<dynamic> _callScanGPT(File imageFile, String scanType) async {
    try {
      // Tối ưu ảnh
      final optimizedBytes = await _optimizeImageBytes(imageFile);

      // Chuyển sang base64
      final base64Image = base64Encode(optimizedBytes);

      // Gọi Cloud Function
      final callable = _functions.httpsCallable('scanGPTWithBase64');
      final result = await callable.call<Map<dynamic, dynamic>>({
        'imageBase64': base64Image,
        'scanType': scanType,
      });

      // Chuyển đổi đúng kiểu dữ liệu
      var convertedData = _convertMap(result.data);

      // Sửa lại Timestamp
      convertedData = _reconstructTimestamp(convertedData);

      return convertedData;
    } catch (e) {
      throw Exception('Lỗi khi xử lý ảnh: ${e.toString()}');
    }
  }

  @override
  Future<Map<String, dynamic>> recognizeDishFromImage(File imageFile) async {
    try {
      // Gọi phương thức chung
      final resultData = await _callScanGPT(imageFile, 'dish');

      // Thêm ID vào kết quả
      resultData['id'] = _uuid.v4();

      return resultData;
    } catch (e) {
      throw Exception('Lỗi khi nhận diện món ăn: ${e.toString()}');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> recognizeIngredientsFromImage(
    File imageFile,
  ) async {
    try {
      // 1. Gọi Cloud Function
      final data = await _callScanGPT(imageFile, 'ingredients');

      // 2. Kiểm tra và trích xuất danh sách
      if (data['ingredients'] is List) {
        // 3. Chuyển đổi kiểu dữ liệu một cách an toàn
        final results = List<Map<String, dynamic>>.from(
          (data['ingredients'] as List).map((item) {
            if (item is Map) {
              return _convertMap(item);
            }
            return <String, dynamic>{};
          }),
        );
        return results;
      }

      return [];
    } catch (e) {
      throw Exception('Lỗi khi nhận diện nguyên liệu: ${e.toString()}');
    }
  }
}
