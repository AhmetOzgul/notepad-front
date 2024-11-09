import 'package:flutter/material.dart';
import 'package:notepad/core/themes/theme.dart';
import 'package:notepad/views/login_screen.dart';
import 'package:provider/provider.dart';

import 'viewmodels/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const materialTheme = MaterialTheme(
      TextTheme(
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NotePad',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    );
  }
}
