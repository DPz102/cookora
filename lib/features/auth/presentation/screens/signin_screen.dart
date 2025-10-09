import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cookora/core/utils/validators.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/core/widgets/highlighted_text.dart';
import 'package:cookora/core/widgets/custom_text_field.dart';
import 'package:cookora/core/widgets/custom_elevated_button.dart';

import 'package:cookora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_event.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_state.dart';
import 'package:cookora/features/auth/presentation/screens/auth_screen_template.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignInPressed() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        EmailSignInRequested(email: email, password: password),
      );
    }
  }

  void _onForgotPasswordPressed() {
    final email = _emailController.text.trim();
    if (Validators.validateEmail(email) == null) {
      context.read<AuthBloc>().add(PasswordResetRequested(email: email));
    } else {
      context.showSnackBar(
        'Vui lòng nhập một email hợp lệ để đặt lại mật khẩu.',
        type: SnackBarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (p, c) =>
          p.requestStatus != c.requestStatus ||
          p.successSignal != c.successSignal,
      listener: (context, state) {
        // Lắng nghe state đặc biệt cho việc reset mật khẩu thành công
        if (state.successSignal == AuthSuccessSignal.passwordReset) {
          context.showSnackBar(
            'Nếu email của bạn tồn tại, một liên kết đặt lại mật khẩu đã được gửi. (Nhớ check trong Spam nhé)',
            type: SnackBarType.success,
          );
          context.read<AuthBloc>().add(const ClearAuthRequestState());
        }
        // Lắng nghe state lỗi chung
        if (state.requestStatus is AsyncFailure) {
          final error = (state.requestStatus as AsyncFailure).error;
          context.showSnackBar(error, type: SnackBarType.error);
          context.read<AuthBloc>().add(const ClearAuthRequestState());
        }
      },

      builder: (context, state) {
        // Lấy trạng thái loading từ state
        final isLoading = state.requestStatus is AsyncLoading;

        return Form(
          key: _formKey,
          child: AuthScreenTemplate(
            title: 'ĐĂNG NHẬP',

            subtitle: 'Nhập email và mật khẩu của bạn để đăng nhập',

            formFields: [
              CustomTextField(
                label: 'Email',
                hintText: 'cookora@gmail.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
              ),

              SizedBox(height: AuthScreenTemplate.verticalGap.h),

              CustomTextField(
                label: 'Mật khẩu',
                hintText: '********',
                controller: _passwordController,
                obscureText: true,
                validator: Validators.validatePassword,
              ),
            ],

            belowForm: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _onForgotPasswordPressed,
                  child: Text(
                    'Quên mật khẩu?',
                    style: textTheme.bodyLarge?.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),

            primaryButton: CustomElevatedButton(
              onPressed: _onSignInPressed,
              text: 'Đăng nhập',
              isLoading: isLoading,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.tertiary,
                foregroundColor: colorScheme.onSurface,
                textStyle: textTheme.labelLarge,
              ),
            ),

            socialButtons: [
              /*SocialLoginButton(
                  text: 'Tiếp tục với Facebook',
                  iconPath: 'assets/icons/facebook.svg',
                  onPressed: () {},
                ),
                SizedBox(height: 12.h),
                SocialLoginButton(
                  text: 'Tiếp tục với Google',
                  iconPath: 'assets/icons/google.svg',
                  onPressed: () {},
                ),*/
            ],
            footer: HighlightedText(
              text: 'Chưa có tài khoản? **Đăng ký**',
              style: textTheme.bodySmall!,
              highlightStyle: textTheme.bodySmall!.copyWith(
                color: colorScheme.primary,
              ),
              onHighlightTap: () => context.go('/signup'),
            ),
          ),
        );
      },
    );
  }
}
