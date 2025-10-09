import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/validators.dart';
import 'package:cookora/core/widgets/custom_elevated_button.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text('Đổi mật khẩu'),
      ),
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

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildPasswordField(
                  controller: _currentPasswordController,
                  labelText: 'Mật khẩu hiện tại',
                  isVisible: _isCurrentPasswordVisible,
                  onToggleVisibility: () {
                    setState(
                      () => _isCurrentPasswordVisible =
                          !_isCurrentPasswordVisible,
                    );
                  },
                ),
                SizedBox(height: 20.h),
                _buildPasswordField(
                  controller: _newPasswordController,
                  labelText: 'Mật khẩu mới',
                  isVisible: _isNewPasswordVisible,
                  onToggleVisibility: () {
                    setState(
                      () => _isNewPasswordVisible = !_isNewPasswordVisible,
                    );
                  },
                ),
                SizedBox(height: 8.h),
                Text('Mật khẩu phải có ít nhất 6 ký tự.'),
                const Spacer(),
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (p, c) => p.requestStatus != c.requestStatus,
                  builder: (context, state) {
                    final isLoading = state.requestStatus is AsyncLoading;
                    return CustomElevatedButton(
                      text: 'Xác nhận',
                      isLoading: isLoading,
                      onPressed: _onSubmit,
                    );
                  },
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
          onPressed: onToggleVisibility,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      validator: Validators.validatePassword,
    );
  }
}
