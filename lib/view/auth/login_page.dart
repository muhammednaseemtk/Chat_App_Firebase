import 'package:chat_app/common/button.dart';
import 'package:chat_app/common/text_field.dart';
import 'package:chat_app/constants/app_color.dart';
import 'package:chat_app/constants/app_text.dart';
import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/view/auth/register_page.dart';
import 'package:chat_app/view/home/home_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();

    return Scaffold(
      backgroundColor: AppColor.bgClr,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(EneftyIcons.message_text_outline,
                  size: 80, color: AppColor.iconClr),
              const SizedBox(height: 20),
              const Text(AppText.lgnMsg,
                  style: TextStyle(
                      color: AppColor.iconClr,
                      fontWeight: FontWeight.w400,
                      fontSize: 17)),
              const SizedBox(height: 40),

              CommonTextField(
                  txt: 'Email',
                  controller: _emailController,
                  obsecureTxt: false),
              const SizedBox(height: 10),
              CommonTextField(
                  txt: 'Password',
                  controller: _passwordController,
                  obsecureTxt: true),

              // Error message
              if (controller.status == AuthStatus.error)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(controller.errorMessage,
                      style: const TextStyle(color: Colors.redAccent)),
                ),

              const SizedBox(height: 40),

              controller.status == AuthStatus.loading
                  ? const CircularProgressIndicator(color: AppColor.iconClr)
                  : CommonButton(
                      txt: 'Login',
                      onPressed: () async {
                        final success = await controller.login(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                        if (success && context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomePage()),
                          );
                        }
                      },
                    ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppText.lgnMsg1,
                      style: TextStyle(
                          color: AppColor.iconClr,
                          fontWeight: FontWeight.w400,
                          fontSize: 17)),
                  TextButton(
                    onPressed: () {
                      controller.resetStatus();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => RegisterPage()));
                    },
                    child: const Text('Register now',
                        style: TextStyle(
                            color: AppColor.iconClr,
                            fontWeight: FontWeight.w800,
                            fontSize: 17)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}