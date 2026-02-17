import 'package:chat_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String txt;
  final bool obsecureTxt;
  final TextEditingController controller;
  const CommonTextField({super.key,required this.txt,required this.controller,required this.obsecureTxt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 8),
      child: TextField(
        cursorColor: AppColor.iconClr,
        controller: controller,
        obscureText: obsecureTxt,
        style: TextStyle(color: AppColor.white),
        decoration: InputDecoration(
          hintText: txt,
          hintStyle: TextStyle(color: AppColor.shade),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.iconClr)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.iconClr)
          )
        ),
      ),
    );
  }
}