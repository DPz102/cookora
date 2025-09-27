import 'dart:io';
import 'package:cookora/features/scan/domain/entities/scan_result.dart';

abstract class ScanRepository {
  Future<ScanResult> recognizeFromImage({
    required File imageFile,
    required bool isDishScan,
  });
}
