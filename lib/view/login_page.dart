import 'package:chat_app/common/common_text_field.dart';
import 'package:chat_app/constants/app_color.dart';
import 'package:chat_app/constants/app_text.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            CommonTextField(),
          ],
        ),
      ),
    );
  }
}
