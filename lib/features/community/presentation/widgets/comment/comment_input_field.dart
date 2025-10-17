import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/widgets/custom_network_image.dart';

import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/community/domain/entities/comment_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/core/utils/async_state.dart';

class CommentInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSend;
  final CommentEntity? replyingTo;
  final VoidCallback? onCancelReply;

  const CommentInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSend,
    this.replyingTo,
    this.onCancelReply,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Lấy thông tin user hiện tại từ UserBloc
    final UserEntity? currentUser = context
        .watch<UserBloc>()
        .state
        .profileStatus
        .whenOrNull(success: (user) => user);

    final avatarUrl = currentUser?.photoURL;

    return Padding(
      // Thêm padding để widget không bị che bởi bàn phím
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 90.h,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- WIDGET MỚI HIỂN THỊ KHI REPLY ---
            if (replyingTo != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Đang trả lời ${replyingTo!.authorUsername}...',
                      style: textTheme.bodySmall,
                    ),
                    IconButton(
                      icon: Icon(Icons.close, size: 16.sp),
                      onPressed: onCancelReply,
                    ),
                  ],
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar
                CustomNetworkImage(
                  imageUrl: (avatarUrl != null && avatarUrl.isNotEmpty)
                      ? avatarUrl
                      : 'https://ui-avatars.com/api/?name=${currentUser?.username ?? '?'}&background=random',
                  height: 40.r,
                  width: 40.r,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                SizedBox(width: 12.w),
                // Ô nhập liệu
                Expanded(
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode,
                    style: textTheme.bodyLarge,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Viết bình luận...',
                      filled: true,
                      fillColor: colorScheme.surface, // Màu nền của ô input
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.r),
                        borderSide: BorderSide.none, // Bỏ viền
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                // Nút gửi
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (context, value, child) {
                    return IconButton(
                      icon: Icon(Icons.send_rounded, size: 28.sp),
                      color: colorScheme.primary,
                      // Nút chỉ bật khi có text
                      onPressed: value.text.trim().isNotEmpty ? onSend : null,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
