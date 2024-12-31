import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/constants/app_radius.dart';
import 'package:notepad/core/constants/navigation_constants.dart';
import 'package:notepad/core/widgets/custom_black_button.dart';
import 'package:notepad/core/widgets/custom_textfield.dart';
import 'package:notepad/viewmodels/auth_provider.dart';
import 'package:notepad/views/login_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController passwordAgainController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox.fromSize(
          size: MediaQuery.of(context).size,
          child: Column(
            children: [
              const Spacer(
                flex: 4,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: AppRadius.large,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                "Kayıt Ol",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomTextField(
                  hintText: "E-Posta",
                  controller: emailController,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomTextField(
                  hintText: "Kullanıcı Adı",
                  controller: usernameController,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomTextField(
                  hintText: "Şifre",
                  controller: passwordController,
                  isPassword: true,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomTextField(
                  hintText: "Şifre Tekrar",
                  controller: passwordAgainController,
                  isPassword: true,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              CustomBlackButton(
                onPressed: () async {
                  String email = emailController.text.trim();
                  String username = usernameController.text.trim();
                  String password = passwordController.text.trim();
                  String passwordAgain = passwordAgainController.text.trim();

                  if (password != passwordAgain) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Şifreler eşleşmiyor. Lütfen tekrar deneyin."),
                      ),
                    );
                    return;
                  }

                  final success = await context
                      .read<AuthProvider>()
                      .register(email, username, password);

                  if (success) {
                    context.go(NavigationConstants.homeScreen);
                  } else {
                    final errorMessage =
                        context.read<AuthProvider>().errorMessage ??
                            'Bilinmeyen bir hata oluştu.';
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(errorMessage),
                      ),
                    );
                  }
                },
                hintText: "Kayıt Ol",
              ),
              const Spacer(
                flex: 1,
              ),
              const LoginOrRegisterWidget(
                isLogin: false,
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
