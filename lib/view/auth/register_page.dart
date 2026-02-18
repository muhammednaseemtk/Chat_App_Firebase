import 'package:chat_app/common/button.dart';
import 'package:chat_app/common/text_field.dart';
import 'package:chat_app/constants/app_color.dart';
import 'package:chat_app/constants/app_text.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
   RegisterPage({super.key});

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
              AppText.rgMsg,
              style: TextStyle(
                color: AppColor.iconClr,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),

            SizedBox(height: 30),

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

            SizedBox(height: 10,),

            CommonTextField(
              txt: 'Confirm Password',
              controller: _confirmPasswordController,
              obsecureTxt: true,
            ),

            SizedBox(height: 70),

            CommonButton(txt: 'Register', onPressed: () {}),

            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.rgMsg1,
                  style: TextStyle(
                    color: AppColor.iconClr,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),

                TextButton(onPressed: (){}, child: Text('Login now', style: TextStyle(
                    color: AppColor.iconClr,
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                  ),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}