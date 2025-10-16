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

  // Pantry-specific validators

  // Kiểm tra số lượng nguyên liệu
  static String? validateQuantity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Số lượng không được để trống.';
    }

    final quantity = double.tryParse(value.trim());
    if (quantity == null) {
      return 'Số lượng phải là số.';
    }

    if (quantity <= 0) {
      return 'Số lượng phải lớn hơn 0.';
    }

    if (quantity > 9999) {
      return 'Số lượng quá lớn (tối đa 9999).';
    }

    return null;
  }

  // Kiểm tra ngày hết hạn
  static String? validateExpiryDate(DateTime? date) {
    if (date == null) {
      return 'Ngày hết hạn không được để trống.';
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final expiryDay = DateTime(date.year, date.month, date.day);

    if (expiryDay.isBefore(today)) {
      return 'Ngày hết hạn không thể là ngày trong quá khứ.';
    }

    return null;
  }

  // Kiểm tra vị trí lưu trữ
  static String? validateStorageLocation(String? location) {
    final requiredError = validateRequired(location, 'Vị trí lưu trữ');
    if (requiredError != null) {
      return requiredError;
    }

    if (location!.length > 50) {
      return 'Tên vị trí quá dài (tối đa 50 ký tự).';
    }

    return null;
  }

  // Kiểm tra ghi chú (optional field)
  static String? validateNote(String? note) {
    if (note != null && note.length > 200) {
      return 'Ghi chú quá dài (tối đa 200 ký tự).';
    }
    return null;
  }
}
