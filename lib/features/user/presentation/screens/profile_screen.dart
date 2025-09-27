import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cookora/core/widgets/async_state_builder.dart';
import 'package:cookora/core/widgets/custom_network_image.dart';

import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/presentation/bloc/user_state.dart';
import 'package:cookora/features/user/presentation/bloc/user_event.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang cá nhân'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/profile/settings'),
          ),
        ],
      ),
      body: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    // Dùng ListView để nội dung có thể cuộn nếu màn hình nhỏ.
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      children: [
        _ProfileHeader(),
        SizedBox(height: 24.h),
        _UserPostsGrid(),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  // Thay đổi ảnh đại diện
  void _changeAvatar(BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null && context.mounted) {
        context.read<UserBloc>().add(UpdateAvatar(image));
      } else {}
    } catch (e) {
      throw Exception('Xử lý ảnh thất bại.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (p, c) =>
          p.profileStatus != c.profileStatus ||
          p.isUploadingAvatar != c.isUploadingAvatar,
      builder: (context, state) {
        return AsyncStateBuilder<UserEntity>(
          asyncState: state.profileStatus,
          successBuilder: (_, user) => Column(
            children: [
              SizedBox(
                height: 100.r,
                width: 100.r,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Avatar người dùng
                    state.isUploadingAvatar
                        ? CircleAvatar(
                            radius: 50.r,
                            child: const CircularProgressIndicator(),
                          )
                        : CustomNetworkImage(
                            imageUrl: user.photoURL.isNotEmpty
                                ? user.photoURL
                                : 'https://ui-avatars.com/api/?name=${user.username}&background=random&size=128',
                            borderRadius: BorderRadius.circular(50.r),
                          ),

                    // Nút camera
                    Positioned(
                      bottom: -5.h,
                      right: -10.w,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: colorScheme.surface,
                          shape: const CircleBorder(),
                          side: BorderSide(
                            color: colorScheme.outline,
                            width: 1.sp,
                          ),
                        ),
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 20.r,
                          color: colorScheme.primary,
                        ),
                        onPressed: state.isUploadingAvatar
                            ? null
                            : () => _changeAvatar(context),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                user.username,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 8.h),
              Text(
                user.email,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _UserPostsGrid extends StatelessWidget {
  const _UserPostsGrid();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (p, c) => p.postsStatus != c.postsStatus,
      builder: (context, state) {
        return AsyncStateBuilder<List<PostEntity>>(
          asyncState: state.postsStatus,
          successBuilder: (_, posts) => posts.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: Text('Bạn chưa có bài đăng nào.'),
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.w,
                    mainAxisSpacing: 4.h,
                  ),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return CustomNetworkImage(
                      imageUrl: posts[index].imageUrl,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(4.r),
                    );
                  },
                ),
        );
      },
    );
  }
}
