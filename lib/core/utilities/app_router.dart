import 'package:auth_with_firebase_application/features/auth/presentation/views/auth_view.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/forget_password_view.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/sign_in_view.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/sing_up_view.dart';
import 'package:auth_with_firebase_application/features/home/presentation/views/home_view.dart';
import 'package:auth_with_firebase_application/features/verify_email/presentation/views/verify_email_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthView(),
    ),
    GoRoute(
      path: AuthView.id,
      builder: (context, state) => const AuthView(),
    ),
    GoRoute(
      path: SignInView.id,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: SignUpView.id,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: ForgetPasswordView.id,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: HomeView.id,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: VerifyEmailView.id,
      builder: (context, state) => const VerifyEmailView(),
    ),
  ]);
}
