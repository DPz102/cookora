import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cookora/core/widgets/async_state_builder.dart';
import 'package:cookora/core/widgets/custom_network_image.dart';
import 'package:cookora/core/widgets/glassmorphic_container.dart';

import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/presentation/bloc/user_event.dart';
import 'package:cookora/features/user/presentation/bloc/user_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: const _ProfileView(),
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Yêu cầu 2: Dùng Column để chia bố cục cố định và có thể cuộn
    return SafeArea(
      child: Column(
        children: [
          // Phần AppBar tùy chỉnh (cố định)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: AppBar(
              title: Text(
                'Trang cá nhân',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.share_outlined, size: 26.sp),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings_outlined, size: 28.sp),
                  onPressed: () => context.push('/profile/settings'),
                ),
              ],
            ),
          ),
          // Thẻ thông tin người dùng (cố định)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const _ProfileHeader(),
          ),
          SizedBox(height: 24.h),
          // Thanh TabBar (cố định)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TabBar(
              labelColor: colorScheme.primary,
              unselectedLabelColor: colorScheme.inversePrimary,
              indicatorColor: colorScheme.primary,
              tabs: const [
                Tab(icon: Icon(Icons.grid_on_outlined)),
                Tab(icon: Icon(Icons.bookmark_border_outlined)),
              ],
            ),
          ),
          // Nội dung TabBarView (có thể cuộn)
          Expanded(
            child: TabBarView(
              children: [
                _UserPostsGrid(),
                Center(child: Text('Chưa có bài đăng nào được lưu.')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (p, c) =>
          p.profileStatus != c.profileStatus ||
          p.isUploadingAvatar != c.isUploadingAvatar,
      builder: (context, state) {
        return AsyncStateBuilder<UserEntity>(
          asyncState: state.profileStatus,
          successBuilder: (_, user) {
            return GlassmorphicContainer(
              borderRadius: 25.r,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                child: Column(
                  children: [
                    _UserInfo(user: user, state: state),
                    SizedBox(height: 24.h),
                    const _UserStats(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({required this.user, required this.state});
  final UserEntity user;
  final UserState state;

  void _changeAvatar(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && context.mounted) {
      context.read<UserBloc>().add(UpdateAvatar(image));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Lấy URL ảnh, nếu không có thì dùng API placeholder
    final imageUrl = user.photoURL.isNotEmpty
        ? user.photoURL
        : 'https://ui-avatars.com/api/?name=${user.username}&background=random&size=128';

    return Column(
      children: [
        SizedBox(
          height: 90.r,
          width: 90.r,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 45.r,
                backgroundImage: !state.isUploadingAvatar
                    ? NetworkImage(imageUrl)
                    : null,
                child: state.isUploadingAvatar
                    ? const CircularProgressIndicator()
                    : null,
              ),

              // Yêu cầu 2: Style lại nút edit avatar
              Positioned(
                right: -5.w,
                bottom: -5.h,
                child: Material(
                  color: colorScheme.primary,
                  shape: const CircleBorder(),
                  elevation: 2,
                  child: SizedBox(
                    width: 32.r,
                    height: 32.r,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 18.r,
                      icon: Icon(
                        Icons.edit_outlined,
                        color: colorScheme.onPrimary,
                      ),
                      onPressed: state.isUploadingAvatar
                          ? null
                          : () => _changeAvatar(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Text(user.username, style: textTheme.headlineSmall),
        SizedBox(height: 8.h),
        Text(
          user.email,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.inversePrimary,
          ),
        ),
      ],
    );
  }
}

class _UserStats extends StatelessWidget {
  const _UserStats();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(count: '12', label: 'bài viết'),
        _StatItem(count: '8', label: 'người theo dõi'),
        _StatItem(count: '23', label: 'đang theo dõi'),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.count, required this.label});
  final String count;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          count,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4.h),
        Text(label, style: textTheme.bodyMedium),
      ],
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
          successBuilder: (_, posts) {
            if (posts.isEmpty) {
              return const Center(child: Text('Bạn chưa có bài đăng nào.'));
            }
            return GridView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return CustomNetworkImage(
                  imageUrl: posts[index].imageUrl,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(15.r),
                );
              },
            );
          },
        );
      },
    );
  }
}
