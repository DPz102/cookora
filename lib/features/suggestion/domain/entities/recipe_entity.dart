import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'recipe_entity.freezed.dart';
part 'recipe_entity.g.dart';

// Enum để định danh nguồn gốc của công thức
enum RecipeSource {
  @JsonValue('cookora_db')
  cookoraDb, // Công thức có sẵn trong DB của app

  @JsonValue('scanned')
  scanned, // Công thức từ kết quả quét AI

  @JsonValue('user_saved')
  userSaved, // Công thức do người dùng tự tạo hoặc lưu lại

  @JsonValue('unknown')
  unknown,
}

// Converter để xử lý Timestamp của Firestore
DateTime? _timestampToDateTime(Timestamp? timestamp) => timestamp?.toDate();
Timestamp? _dateTimeToTimestamp(DateTime? dateTime) =>
    dateTime == null ? null : Timestamp.fromDate(dateTime);

@freezed
abstract class RecipeEntity with _$RecipeEntity {
  const factory RecipeEntity({
    // --- Dữ liệu cốt lỗi ---
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    @Default([]) List<String> requiredIngredients,
    @Default([]) List<String> optionalIngredients,
    @Default([]) List<String> instructions,

    // --- Siêu dữ liệu (Metadata) ---
    @Default(RecipeSource.unknown) RecipeSource source,
    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    DateTime? createdAt,
    @Default(false) bool isUserFavorite,

    // -- Các trường dự trù cho tương lai
    @Default(2) int servingSize, // Suất ăn cho mấy người
    @Default(20) int cookTimeInMinutes, // Thời gian nấu (phút)
    @Default('Dễ') String difficulty, // Độ khó: Dễ, Trung bình, Khó
  }) = _RecipeEntity;

  factory RecipeEntity.fromJson(Map<String, dynamic> json) =>
      _$RecipeEntityFromJson(json);
}
