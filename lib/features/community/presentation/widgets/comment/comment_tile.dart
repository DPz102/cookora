import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:cookora/core/widgets/custom_network_image.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/community/domain/entities/comment_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';

class CommentTile extends StatelessWidget {
  final CommentEntity comment;
  final VoidCallback? onReply;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const CommentTile({
    super.key,
    required this.comment,
    this.onReply,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    // ✅ Lấy UID của user hiện tại
    final currentUserId = context
        .watch<UserBloc>()
        .state
        .profileStatus
        .whenOrNull(success: (user) => user.uid);

    // ✅ Kiểm tra xem user hiện tại có phải chủ comment không
    final isOwner = currentUserId != null && currentUserId == comment.authorId;

    // Định dạng thời gian "X phút trước"
    timeago.setLocaleMessages('vi', timeago.ViMessages());
    final timeAgoString = comment.createdAt != null
        ? timeago.format(comment.createdAt!, locale: 'vi')
        : 'Vừa xong';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CustomNetworkImage(
            imageUrl: comment.authorAvatarUrl.isNotEmpty
                ? comment.authorAvatarUrl
                : 'https://ui-avatars.com/api/?name=${comment.authorUsername}&background=random',
            height: 40.r,
            width: 40.r,
            borderRadius: BorderRadius.circular(20.r),
          ),
          SizedBox(width: 12.w),
          // Phần nội dung comment
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bubble chứa username và content
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.authorUsername,
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(comment.content, style: textTheme.bodyLarge),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),
                // Các action: thời gian, trả lời, sửa, xóa
                Row(
                  children: [
                    Text(timeAgoString, style: textTheme.bodySmall),
                    SizedBox(width: 16.w),
                    _buildActionButton(textTheme, 'Trả lời', onReply),
                    // ✅ CHỈ HIỆN NÚT SỬA/XÓA NẾU LÀ CHỦ SỞ HỮU
                    if (isOwner) ...[
                      SizedBox(width: 16.w),
                      _buildActionButton(textTheme, 'Sửa', onEdit),
                      SizedBox(width: 16.w),
                      _buildActionButton(
                        textTheme,
                        'Xóa',
                        onDelete,
                        color: colorScheme.error,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    TextTheme textTheme,
    String label,
    VoidCallback? onTap, {
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
