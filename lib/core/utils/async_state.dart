import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
abstract class AsyncState<T> with _$AsyncState<T> {
  // Trạng thái ban đầu, chưa làm gì
  const factory AsyncState.initial() = AsyncInitial;

  // Trạng thái đang tải
  const factory AsyncState.loading() = AsyncLoading;

  // Trạng thái thành công, chứa dữ liệu trả về
  const factory AsyncState.success(T data) = AsyncSuccess<T>;

  // Trạng thái thất bại, chứa thông báo lỗi
  const factory AsyncState.failure(String error) = AsyncFailure<T>;
}
