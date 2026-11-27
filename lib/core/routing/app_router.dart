import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nivo/core/helpers/shared_pref_helper.dart';
import 'package:nivo/core/routing/routes.dart';
import 'package:nivo/core/utils/shared_pref_keys.dart';
import 'package:nivo/features/authentication/presentation/screens/create_account_screen.dart';
import 'package:nivo/features/authentication/presentation/screens/login_screen.dart';
import 'package:nivo/features/onboarding/presentation/screens/onboarding_screen.dart';

abstract class AppRouter {
  static late final GoRouter router;

  static void initRouter() {
    final onboardingCompleted =
        SharedPrefHelper.getBool(key: SharedPrefKeys.onboardingCompleted) ??
            false;

    router = GoRouter(
      initialLocation:
          onboardingCompleted ? Routes.login : Routes.onboarding,
      routes: [
        GoRoute(
          path: Routes.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: Routes.login,
          pageBuilder: (context, state) => _buildAuthTransitionPage(
            state: state,
            child: const LoginScreen(),
          ),
        ),
        GoRoute(
          path: Routes.createAccount,
          pageBuilder: (context, state) => _buildAuthTransitionPage(
            state: state,
            child: const CreateAccountScreen(),
          ),
        ),
      ],
    );
  }

  static CustomTransitionPage<void> _buildAuthTransitionPage({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 360),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.03),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}
