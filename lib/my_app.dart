import 'package:cookora/core/di/service_locator.dart';
import 'package:cookora/core/routes/app_router.dart';
import 'package:cookora/core/themes/app_theme.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = locator<AuthBloc>();
    final router = appRouter(authBloc);

    return BlocProvider.value(
      value: authBloc,
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: AppTheme.light(),
        ),
      ),
    );
  }
}
