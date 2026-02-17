import 'package:chat_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String txt;
  final VoidCallback onPressed;
  const CommonButton({super.key,required this.txt,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.bgClr,
          foregroundColor: AppColor.iconClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(19),
            side: BorderSide(color: AppColor.white)
          )
        ),
        onPressed: onPressed, child: Text(txt,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),)),
    );
  }
}