import 'dart:async';

import 'package:cookora/core/routes/main_shell.dart';
import 'package:cookora/core/routes/main_shell_provider.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_state.dart';
import 'package:cookora/features/auth/presentation/screens/signin_screen.dart';
import 'package:cookora/features/auth/presentation/screens/signup_screen.dart';
import 'package:cookora/features/community/presentation/screens/community_screen.dart';
import 'package:cookora/features/pantry/presentation/screens/pantry_screen.dart';
import 'package:cookora/features/scan/presentation/screens/scan_screen.dart';
// Màn hình public
import 'package:cookora/features/splash/screens/splash_screen.dart';
// Màn hình private
import 'package:cookora/features/suggestion/presentation/screens/suggestion_screen.dart';
import 'package:cookora/features/user/presentation/screens/edit_password_screen.dart';
import 'package:cookora/features/user/presentation/screens/profile_screen.dart';
import 'package:cookora/features/user/presentation/screens/setting_screen.dart';
import 'package:cookora/features/welcome/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter(AuthBloc authBloc) {
  // Các route không cần xác thực
  const publicPathsNonSplash = <String>{'/welcome', '/signin', '/signup'};
  final publicPathsWithSplash = publicPathsNonSplash.union({'/splash'});

  return GoRouter(
    initialLocation: '/splash',

    // Lắng nghe sự thay đổi của AuthBloc để refresh lại router
    refreshListenable: GoRouterRefreshStream(authBloc.stream),

    redirect: (context, state) {
      // Lấy trạng thái auth mới nhất từ Bloc
      final authState = authBloc.state;

      // Kịch bản 1: User chưa đăng nhập (unauthenticated)
      if (authState is Unauthenticated) {
        // Nếu họ đang cố vào trang cần đăng nhập, chuyển hướng về welcome
        return publicPathsNonSplash.contains(state.matchedLocation)
            ? null
            : '/welcome';
      }

      // Kịch bản 2: User đã đăng nhập (authenticated)
      if (authState is Authenticated) {
        // Nếu họ đang ở các trang không cần đăng nhập, chuyển vào home
        return publicPathsWithSplash.contains(state.matchedLocation)
            ? '/pantry'
            : null;
      }

      // Mặc định không chuyển hướng (khi state là initial)
      return null;
    },

    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellProvider(
            child: MainShell(navigationShell: navigationShell),
          );
        },
        branches: [
          // Branch 0: Trang chủ
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const SuggestionScreen(),
              ),
            ],
          ),
          // Branch 1: Kho
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/pantry',
                builder: (context, state) => const PantryScreen(),
              ),
            ],
          ),
          // Branch 2: Scan
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/scan',
                builder: (context, state) => const ScanScreen(),
              ),
            ],
          ),
          // Branch 3: Cộng đồng
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/community',
                builder: (context, state) => const CommunityScreen(),
              ),
            ],
          ),
          // Branch 4: Tôi
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: '/settings',
                    builder: (context, state) => const SettingScreen(),
                    routes: [
                      GoRoute(
                        path: '/edit-password',
                        builder: (context, state) => const EditPasswordScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

// Helper class để GoRouter có thể listen stream
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
