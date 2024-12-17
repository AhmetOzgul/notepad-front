import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/routes/app_router.dart';
import 'package:notepad/core/themes/theme.dart';
import 'package:notepad/viewmodels/auth_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final router = await AppRouter.getRouter();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(router: router),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    const materialTheme = MaterialTheme(
      TextTheme(
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'NotePad',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
