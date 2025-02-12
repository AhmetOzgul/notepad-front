import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/constants/navigation_constants.dart';
import 'package:notepad/core/util/network_service.dart';
import 'package:notepad/views/create_note_screen.dart';
import 'package:notepad/views/home_screen.dart';
import 'package:notepad/views/login_screen.dart';
import 'package:notepad/views/note_update_screen.dart';
import 'package:notepad/views/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRouter {
  static Future<GoRouter> getRouter() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    final expiryTimeString = prefs.getString('expiryTime');

    bool isTokenValid = false;
    if (token != null && expiryTimeString != null) {
      final expiryTime = DateTime.parse(expiryTimeString);
      if (DateTime.now().isBefore(expiryTime)) {
        isTokenValid = true;
      }
    }

    return GoRouter(
      navigatorKey: NetworkService.navigatorKey,
      initialLocation: isTokenValid
          ? NavigationConstants.homeScreen
          : NavigationConstants.loginScreen,
      routes: [
        GoRoute(
          path: NavigationConstants.loginScreen,
          pageBuilder: (context, state) =>
              _fadeScaleTransitionPage(const LoginScreen(), state),
        ),
        GoRoute(
          path: NavigationConstants.registerScreen,
          pageBuilder: (context, state) =>
              _fadeScaleTransitionPage(const RegisterScreen(), state),
        ),
        GoRoute(
          path: NavigationConstants.homeScreen,
          pageBuilder: (context, state) =>
              _fadeScaleTransitionPage(const HomeScreen(), state),
        ),
        GoRoute(
          path: NavigationConstants.updateNoteScreen,
          pageBuilder: (context, state) =>
              _fadeScaleTransitionPage(const UpdateNoteScreen(), state),
        ),
        GoRoute(
          path: NavigationConstants.createNoteScreen,
          pageBuilder: (context, state) =>
              _fadeScaleTransitionPage(const CreateNoteScreen(), state),
        ),
      ],
    );
  }

  static CustomTransitionPage _fadeScaleTransitionPage(
      Widget child, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            )),
            child: child,
          ),
        );
      },
    );
  }
}
