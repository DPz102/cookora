import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

class ExceptionHandler {
  static Exception handle(Object e) {
    log('Exception Caught: ${e.runtimeType}', error: e);
    // Xử lý lỗi từ Firebase Authentication
    if (e is FirebaseAuthException) {
      log('Firebase Auth Exception Code: ${e.code}');
      switch (e.code) {
        // Lỗi đăng nhập & Đăng ký
        case 'invalid-email':
        case 'email-already-in-use':
          return Exception(
            'Địa chỉ email không hợp lệ. Vui lòng kiểm tra lại.',
          );

        case 'user-not-found':
        case 'wrong-password':
        case 'invalid-credential':
          return Exception('Email hoặc mật khẩu không chính xác.');

        case 'weak-password':
          return Exception(
            'Mật khẩu quá yếu. Vui lòng chọn mật khẩu có ít nhất 6 ký tự.',
          );

        // Lỗi chung và các lỗi khác
        case 'user-disabled':
          return Exception('Tài khoản này đã bị vô hiệu hóa.');
        case 'too-many-requests':
          return Exception('Đã gửi quá nhiều yêu cầu. Vui lòng thử lại sau.');
        case 'network-request-failed':
          return Exception(
            'Lỗi kết nối mạng. Vui lòng kiểm tra internet và thử lại.',
          );
        case 'requires-recent-login':
          return Exception(
            'Thao tác này yêu cầu đăng nhập lại để đảm bảo an toàn.',
          );

        default:
          return Exception(
            'Đã có lỗi không mong muốn đối với tài khoản. Vui lòng thử lại.',
          );
      }
    }
    // Xử lý lỗi từ Cloud Functions
    else if (e is FirebaseFunctionsException) {
      log('Cloud Functions Exception Code: ${e.code}');
      switch (e.code) {
        case 'unauthenticated':
          return Exception('Bạn phải đăng nhập để sử dụng tính năng này.');
        case 'requires-recent-login':
          return Exception(
            'Thao tác này yêu cầu đăng nhập lại để đảm bảo an toàn.',
          );
        case 'invalid-argument':
          return Exception('Dữ liệu đầu vào không hợp lệ.');
        case 'already-exists':
          return Exception(
            'Tên đăng nhập hoặc Email đã được sử dụng. Vui lòng thử lại.',
          );
        default:
          return Exception(
            'Đã có lỗi không mong muốn đối với Cloud. Vui lòng thử lại.',
          );
      }
    }
    // Xử lý lỗi các lỗi khác từ Firebase
    else if (e is FirebaseException) {
      log('Firestore Exception Code: ${e.code}');
      switch (e.code) {
        case 'permission-denied':
          return Exception('Bạn không có quyền thực hiện thao tác này.');
        case 'unavailable':
          return Exception('Dịch vụ không khả dụng. Vui lòng thử lại sau.');
        case 'not-found':
          return Exception('Không tìm thấy tài nguyên được yêu cầu.');
        default:
          return Exception(
            'Đã có lỗi không mong muốn xảy ra đối với Firebase. Vui lòng thử lại.',
          );
      }
    }

    // Xử lý lỗi không xác định
    return Exception('Đã có lỗi không mong muốn xảy ra. Vui lòng thử lại.');
  }
}
