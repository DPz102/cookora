import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Hiển thị một modal bottom sheet có thể cuộn, chứa nội dung từ file markdown.
Future<void> showMarkdownBottomSheet(
  BuildContext context, {
  required String filePath,
}) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Cho phép she
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      // Dùng DraggableScrollableSheet để người dùng có thể thay đổi chiều cao sheet
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6, // Chiều cao ban đầu
        minChildSize: 0.3, // Chiều cao nhỏ nhất
        maxChildSize: 0.9, // Chiều cao lớn nhất
        builder: (context, scrollController) {
          return Column(
            children: [
              // Thanh kéo (drag handle)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0.h),
                child: Container(
                  width: 40.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: colorScheme.outline,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),

              // Nội dung Markdown
              Expanded(
                // Dùng FutureBuilder để tải nội dung file bất đồng bộ
                child: FutureBuilder<String>(
                  future: rootBundle.loadString(filePath),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Markdown(
                        controller: scrollController,
                        data: snapshot.data!,
                        padding: EdgeInsets.only(
                          left: 24.w,
                          right: 24.w,
                          bottom: 40.h,
                        ),
                        styleSheet: MarkdownStyleSheet.fromTheme(theme),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
