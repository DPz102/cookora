import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/core/utils/validators.dart';
import 'package:cookora/core/widgets/custom_elevated_button.dart';
import 'package:cookora/core/widgets/glassmorphic_container.dart';

import 'package:cookora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_event.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_state.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        PasswordChanged(
          currentPassword: _currentPasswordController.text,
          newPassword: _newPasswordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (p, c) =>
            p.requestStatus != c.requestStatus ||
            p.successSignal != c.successSignal,
        listener: (context, state) {
          if (state.successSignal == AuthSuccessSignal.passwordChange) {
            context.showSnackBar(
              'Đổi mật khẩu thành công!',
              type: SnackBarType.success,
            );
            context.read<AuthBloc>().add(const ClearAuthRequestState());
            context.pop();
          }
          final status = state.requestStatus;
          if (status is AsyncFailure) {
            context.showSnackBar(status.error, type: SnackBarType.error);
            context.read<AuthBloc>().add(const ClearAuthRequestState());
          }
        },
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: AppBar(
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => context.pop(),
                      ),
                      title: Text(
                        'Đổi mật khẩu',
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildGlassmorphicPasswordField(
                              controller: _currentPasswordController,
                              labelText: 'Mật khẩu hiện tại',
                              isVisible: _isCurrentPasswordVisible,
                              onToggleVisibility: () => setState(
                                () => _isCurrentPasswordVisible =
                                    !_isCurrentPasswordVisible,
                              ),
                              validator: Validators.validatePassword,
                            ),
                            SizedBox(height: 20.h),
                            _buildGlassmorphicPasswordField(
                              controller: _newPasswordController,
                              labelText: 'Mật khẩu mới',
                              isVisible: _isNewPasswordVisible,
                              onToggleVisibility: () => setState(
                                () => _isNewPasswordVisible =
                                    !_isNewPasswordVisible,
                              ),
                              validator: (value) =>
                                  Validators.validateNewPassword(
                                    value,
                                    _currentPasswordController.text,
                                  ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'Mật khẩu phải có ít nhất 6 ký tự.',
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.inversePrimary,
                              ),
                            ),
                            const Spacer(),
                            BlocBuilder<AuthBloc, AuthState>(
                              buildWhen: (p, c) =>
                                  p.requestStatus != c.requestStatus,
                              builder: (context, state) {
                                final isLoading =
                                    state.requestStatus is AsyncLoading;
                                return SizedBox(
                                  width: double.infinity,
                                  child: CustomElevatedButton(
                                    text: 'Xác nhận',
                                    isLoading: isLoading,
                                    onPressed: _onSubmit,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: colorScheme.primary,
                                    ),
                                    textStyle: textTheme.labelLarge?.copyWith(
                                      color: colorScheme.onPrimary,
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 70.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassmorphicPasswordField({
    required TextEditingController controller,
    required String labelText,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return GlassmorphicContainer(
      borderRadius: 12.r,
      blurSigma: 10.0,
      // Yêu cầu 1: Sửa lại cách dùng opacity
      backgroundColor: colorScheme.surface.withAlpha(51), // 20% opacity
      shadowColor: Colors.black.withAlpha(38), // 15% opacity
      shadowElevation: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: TextFormField(
          controller: controller,
          obscureText: !isVisible,
          style: TextStyle(color: colorScheme.onSurface),
          decoration: InputDecoration(
            // Yêu cầu 2: Tắt màu nền mặc định của TextFormField
            filled: false,
            labelText: labelText,
            hintText: '••••••',
            prefixIcon: Icon(
              Icons.lock_outline,
              color: colorScheme.inversePrimary,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: colorScheme.inversePrimary,
              ),
              onPressed: onToggleVisibility,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            labelStyle: TextStyle(color: colorScheme.inversePrimary),
            hintStyle: TextStyle(
              color: colorScheme.inversePrimary.withAlpha(179),
            ), // 70% opacity
          ),
          validator: validator ?? Validators.validatePassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}
