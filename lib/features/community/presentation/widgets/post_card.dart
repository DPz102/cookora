import 'package:cookora/core/widgets/custom_network_image.dart';
import 'package:cookora/core/widgets/glassmorphic_container.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/presentation/bloc/community_bloc.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: GlassmorphicContainer(
        width: double.infinity,
        borderRadius: 20.r,
        blurSigma: 10.0,
        backgroundColor: colorScheme.surface.withAlpha(102),
        shadowColor: Colors.black.withAlpha(26),
        shadowElevation: 8.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 8.h),
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
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Body: Ảnh
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: CustomNetworkImage(
                imageUrl: post.imageUrl,
                width: double.infinity,
                height: (1.sw - 32.w) * 0.75,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),

            // Caption
            if (post.caption.isNotEmpty)
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 8.h),
                child: Text(post.caption, style: textTheme.bodyLarge),
              ),

            // Footer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildInteractionItem(
                        context,
                        icon: isLiked ? Icons.favorite : Icons.favorite_border,
                        iconColor: isLiked ? colorScheme.error : null,
                        count: post.likes.length,
                        onPressed: () {
                          if (post.id != null) {
                            final event = isLiked
                                ? UnlikePost(post.id!)
                                : LikePost(post.id!);
                            context.read<CommunityBloc>().add(event);
                          }
                        },
                      ),
                      SizedBox(width: 16.w),
                      _buildInteractionItem(
                        context,
                        icon: Icons.chat_bubble_outline,
                        count: 12,
                        onPressed: () {},
                      ),
                      SizedBox(width: 16.w),
                      _buildInteractionItem(
                        context,
                        icon: Icons.send_outlined,
                        count: 5,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.bookmark_border_outlined, size: 26.sp),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractionItem(
    BuildContext context, {
    required IconData icon,
    required int count,
    required VoidCallback onPressed,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
        child: Row(
          children: [
            Icon(icon, size: 26.sp, color: iconColor),
            SizedBox(width: 6.w),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
