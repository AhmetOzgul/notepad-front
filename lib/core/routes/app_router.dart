import 'package:go_router/go_router.dart';
import 'package:notepad/core/constants/navigation_constants.dart';
import 'package:notepad/views/home_screen.dart';
import 'package:notepad/views/login_screen.dart';
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
      initialLocation: isTokenValid
          ? NavigationConstants.homeScreen
          : NavigationConstants.loginScreen,
      routes: [
        GoRoute(
          path: NavigationConstants.loginScreen,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: NavigationConstants.registerScreen,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: NavigationConstants.homeScreen,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }
}
