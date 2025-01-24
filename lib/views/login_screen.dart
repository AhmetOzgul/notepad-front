import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/constants/app_radius.dart';
import 'package:notepad/core/constants/navigation_constants.dart';
import 'package:notepad/core/widgets/custom_black_button.dart';
import 'package:notepad/core/widgets/custom_textfield.dart';
import 'package:notepad/viewmodels/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController emailController = TextEditingController();

final TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    emailController.text = "ahmet@gmail.com";
    passwordController.text = "12345678";
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
                "Hoşgeldiniz!",
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
                  hintText: "Şifre",
                  controller: passwordController,
                  isPassword: true,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              CustomBlackButton(
                onPressed: () async {
                  String email = emailController.text;
                  String password = passwordController.text;
                  final success =
                      await context.read<AuthProvider>().login(email, password);
                  if (success) {
                    context.go(NavigationConstants.homeScreen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Kullanıcı adı veya şifre hatalı"),
                      ),
                    );
                  }
                },
                hintText: "Giriş Yap",
              ),
              const Spacer(
                flex: 1,
              ),
              const LoginOrRegisterWidget(
                isLogin: true,
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

class LoginOrRegisterWidget extends StatelessWidget {
  const LoginOrRegisterWidget({
    super.key,
    required this.isLogin,
  });

  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isLogin ? "Hesabın yok mu?" : "Zaten bir hesabın var mı?",
            style: Theme.of(context).textTheme.bodyLarge),
        InkWell(
          borderRadius: AppRadius.extraLarge,
          onTap: () {
            context.go(isLogin
                ? NavigationConstants.registerScreen
                : NavigationConstants.loginScreen);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isLogin ? "Kayıt Ol" : "Giriş Yap",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
