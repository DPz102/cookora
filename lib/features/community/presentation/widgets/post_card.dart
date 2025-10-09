import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cookora/core/widgets/custom_network_image.dart';

import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/presentation/bloc/community_bloc.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final bool isLiked =
        currentUser != null && post.likes.contains(currentUser.uid);

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header và Tên người đăng
          Padding(
            padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 0),
            child: Row(
              children: [
                CustomNetworkImage(
                  imageUrl: post.authorAvatarUrl.isNotEmpty
                      ? post.authorAvatarUrl
                      : 'https://ui-avatars.com/api/?name=${post.authorUsername}&background=random',
                  height: 32.r,
                  width: 32.r,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                SizedBox(width: 8.w),
                Text(post.authorUsername, style: textTheme.labelLarge),
              ],
            ),
          ),

          // Padding cho caption và nút Like
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                if (post.caption.isNotEmpty) ...[
                  Text(post.caption, style: textTheme.bodyMedium),
                  SizedBox(height: 4.h),
                ],
                CustomNetworkImage(
                  imageUrl: post.imageUrl,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? colorScheme.error : null,
                      ),
                      onPressed: () {
                        if (post.id != null) {
                          final event = isLiked
                              ? UnlikePost(post.id!)
                              : LikePost(post.id!);
                          context.read<CommunityBloc>().add(event);
                        }
                      },
                    ),
                    Text('${post.likes.length} lượt thích'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
