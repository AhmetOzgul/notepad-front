import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/constants/navigation_constants.dart';
import 'package:notepad/views/login_screen.dart';
import 'package:notepad/views/register_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: NavigationConstants.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: NavigationConstants.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}

class AnimatedPageTransition extends CustomTransitionPage<void> {
  AnimatedPageTransition({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}
