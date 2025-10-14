// features/user/presentation/screens/setting_screen.dart

import 'package:cookora/core/widgets/custom_elevated_button.dart';
import 'package:cookora/core/widgets/glassmorphic_container.dart';
import 'package:cookora/core/widgets/gradient_background.dart';
import 'package:cookora/core/widgets/show_markdown_bottom_sheet.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Xác nhận đăng xuất'),
          content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy'),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text('Đăng xuất'),
              onPressed: () {
                dialogContext.read<AuthBloc>().add(const LogoutRequested());
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar tùy chỉnh
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.pop(),
                ),
                // Yêu cầu 1: Sửa style header
                title: Text(
                  'Cài đặt',
                  style: textTheme.headlineSmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                children: [
                  GlassmorphicContainer(
                    borderRadius: 16.r,
                    child: _buildSettingsList(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 70.h),
              child: _buildLogOutButton(
                context,
                () => _showLogoutConfirmationDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSettingsItem(
          context,
          title: 'Đổi mật khẩu',
          icon: Icons.lock_outline_rounded,
          iconBackgroundColor: colorScheme.onSurface,
          iconColor: colorScheme.surface,
          onTap: () => context.push('/profile/settings/edit-password'),
        ),
        const Divider(indent: 70, height: 1),
        _buildSettingsItem(
          context,
          title: 'Chính sách quyền riêng tư',
          icon: Icons.privacy_tip_outlined,
          iconBackgroundColor: colorScheme.onSurface,
          iconColor: colorScheme.surface,
          onTap: () => showMarkdownBottomSheet(
            context,
            filePath: 'assets/markdown/privacy_policy.md',
          ),
        ),
        const Divider(indent: 70, height: 1),
        _buildSettingsItem(
          context,
          title: 'FAQ',
          icon: Icons.quiz_outlined,
          iconBackgroundColor: colorScheme.onSurface,
          iconColor: colorScheme.surface,
          onTap: () => showMarkdownBottomSheet(
            context,
            filePath: 'assets/markdown/faq.md',
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color iconBackgroundColor,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: CircleAvatar(
        radius: 22.r,
        backgroundColor: iconBackgroundColor,
        child: Icon(icon, color: iconColor, size: 22.sp),
      ),
      title: Text(title, style: textTheme.bodyLarge),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.sp,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      onTap: onTap,
    );
  }

  Widget _buildLogOutButton(BuildContext context, VoidCallback onPressed) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
        text: 'Đăng xuất',
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.errorContainer,
        ),
        textStyle: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.surface,
        ),
      ),
    );
  }
}
