import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/features/login/ui/login_screen.dart';
import 'package:pai/features/password_reset/ui/password_reset_screen.dart';

import '../features/otp_code/ui/otp_code_screen.dart';
import '../features/password_reset/ui/change_password_screen.dart';
import '../features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/signUp',
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: '/otpCode',
        builder: (BuildContext context, GoRouterState state) {
          return const OtpCodeScreen();
        },
      ),
      GoRoute(
        path: '/passwordReset',
        builder: (BuildContext context, GoRouterState state) {
          return const PasswordResetScreen();
        },
      ),
      GoRoute(
        path: '/passwordChange',
        builder: (BuildContext context, GoRouterState state) {
          return const ChangePasswordScreen();
        },
      ),
    ],
  );
}
