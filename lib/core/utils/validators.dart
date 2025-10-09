class Validators {
  // Kiểm tra các trường văn bản không để trống.
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName không được để trống.';
    }
    return null;
  }

  // Kiểm tra định dạng email.
  static String? validateEmail(String? value) {
    final requiredError = validateRequired(value, 'Email');
    if (requiredError != null) {
      return requiredError;
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value!)) {
      return 'Định dạng email không hợp lệ.';
    }

    return null;
  }

  // Kiểm tra độ dài và quy tắc mật khẩu.
  static String? validatePassword(String? value) {
    final requiredError = validateRequired(value, 'Mật khẩu');
    if (requiredError != null) {
      return requiredError;
    }

    if (value!.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự.';
    }
    return null;
  }

  // Kiểm tra các quy tắc cho username.
  static String? validateUsername(String? value) {
    final requiredError = validateRequired(value, 'Tên đăng nhập');
    if (requiredError != null) {
      return requiredError;
    }

    if (value!.length < 3 || value.length > 20) {
      return 'Tên đăng nhập phải dài từ 3-20 ký tự.';
    }

    final usernameRegex = RegExp(r'^[a-zA-Z0-9_.]+$');
    if (!usernameRegex.hasMatch(value)) {
      return 'Chỉ cho phép chữ, số, "." và "_".';
    }

    if (value.startsWith('.') ||
        value.startsWith('_') ||
        value.endsWith('.') ||
        value.endsWith('_')) {
      return 'Không được bắt đầu/kết thúc bằng "." hoặc "_".';
    }

    return null;
  }
}
