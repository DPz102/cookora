// lib/features/user/presentation/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:cookora/features/user/presentation/widgets/profile/profile_widgets.dart';

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ProfileHeader(),
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
          const Expanded(
            child: TabBarView(children: [UserPostsGrid(), SavedPostsGrid()]),
          ),
        ],
      ),
    );
  }
}
