import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:cookora/core/widgets/custom_elevated_button.dart';
import 'package:cookora/core/widgets/show_markdown_bottom_sheet.dart';

import 'package:cookora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_event.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cài đặt'), centerTitle: true),
      body: Column(
        children: [
          // Phần cuộn
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [_buildSettingsList(context)],
            ),
          ),
          // Phần cố định dưới cùng (không cuộn)
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
            child: _buildLogOutButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return Column(
      children: [
        _buildSettingsItem(
          context,
          title: 'Đổi mật khẩu',
          onTap: () => context.push('/profile/settings/edit-password'),
        ),
        _buildSettingsItem(
          context,
          title: 'Chính sách quyền riêng tư',
          onTap: () {
            showMarkdownBottomSheet(
              context,
              filePath: 'assets/markdown/privacy_policy.md',
            );
          },
        ),
        _buildSettingsItem(
          context,
          title: 'FAQ',
          onTap: () {
            showMarkdownBottomSheet(
              context,
              filePath: 'assets/markdown/faq.md',
            );
          },
        ),
      ],
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required String title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      onTap: onTap,
    );
  }

  Widget _buildLogOutButton(BuildContext context) {
    return CustomElevatedButton(
      text: 'Đăng xuất',
      onPressed: () {
        context.read<AuthBloc>().add(const LogoutRequested());
      },
    );
  }
}
