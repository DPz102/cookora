import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/core/utils/validators.dart';
import 'package:cookora/core/widgets/highlighted_text.dart';
import 'package:cookora/core/widgets/custom_text_field.dart';
import 'package:cookora/core/widgets/custom_elevated_button.dart';

import 'package:cookora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_event.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_state.dart';
import 'package:cookora/features/auth/presentation/screens/auth_screen_template.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final username = _usernameController.text.trim();
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        EmailSignUpRequested(
          email: email,
          password: password,
          username: username,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (p, c) => p.requestStatus != c.requestStatus,
      listener: (context, state) {
        if (state.requestStatus case AsyncFailure(error: final error)) {
          context.showSnackBar(error, type: SnackBarType.error);
          context.read<AuthBloc>().add(const ClearAuthRequestState());
        }
      },
      builder: (context, state) {
        final isLoading = state.requestStatus is AsyncLoading;

        return Form(
          key: _formKey,
          child: AuthScreenTemplate(
            title: 'ĐĂNG KÝ',

            subtitle: 'Tạo tài khoản mới của bạn',

            formFields: [
              CustomTextField(
                label: 'Tên đăng nhập',
                hintText: 'cookora',
                controller: _usernameController,
                validator: Validators.validateUsername,
              ),

              SizedBox(height: AuthScreenTemplate.verticalGap.h),

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

            primaryButton: CustomElevatedButton(
              onPressed: _onSignUpPressed,
              text: 'Đăng ký',
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
              text: 'Đã có tài khoản? **Đăng nhập**',
              style: textTheme.bodySmall!,
              highlightStyle: textTheme.bodySmall!.copyWith(
                color: colorScheme.primary,
              ),
              onHighlightTap: () => context.go('/signin'),
            ),
          ),
        );
      },
    );
  }
}
