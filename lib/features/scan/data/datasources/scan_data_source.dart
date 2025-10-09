import 'dart:io';

abstract class ScanDataSource {
  Future<Map<String, dynamic>> recognizeDishFromImage(File imageFile);

  Future<List<Map<String, dynamic>>> recognizeIngredientsFromImage(
    File imageFile,
  );
}
