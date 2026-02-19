import 'package:chat_app/common/button.dart';
import 'package:chat_app/common/text_field.dart';
import 'package:chat_app/constants/app_color.dart';
import 'package:chat_app/constants/app_text.dart';
import 'package:chat_app/view/auth/register_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgClr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              EneftyIcons.message_text_outline,
              size: 80,
              color: AppColor.iconClr,
            ),

            SizedBox(height: 20),

            Text(
              AppText.lgnMsg,
              style: TextStyle(
                color: AppColor.iconClr,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),

            SizedBox(height: 40),

            CommonTextField(
              txt: 'Email',
              controller: _emailController,
              obsecureTxt: false,
            ),

            SizedBox(height: 10),

            CommonTextField(
              txt: 'Password',
              controller: _passwordController,
              obsecureTxt: true,
            ),

            SizedBox(height: 60),

            CommonButton(txt: 'Login', onPressed: () {}),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.lgnMsg1,
                  style: TextStyle(
                    color: AppColor.iconClr,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      color: AppColor.iconClr,
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
