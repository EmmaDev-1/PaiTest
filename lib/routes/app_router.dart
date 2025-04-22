import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/features/login/ui/login_screen.dart';
import 'package:pai/features/password_reset/ui/password_reset_screen.dart';
import '../features/create_payment_method/ui/create_payment_method_screen.dart';
import '../features/dashboard/ui/dashboard_screen.dart';
import '../features/otp_code/ui/otp_code_screen.dart';
import '../features/password_reset/ui/change_password_screen.dart';
import '../features/payment_methods/ui/payment_methods_screen.dart';
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
      GoRoute(
        path: '/dashboard',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const DashboardScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(curvedAnimation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/paymentMethods',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PaymentMethodsScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(curvedAnimation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/create_payment_method',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const CreatePaymentMethodScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(curvedAnimation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
