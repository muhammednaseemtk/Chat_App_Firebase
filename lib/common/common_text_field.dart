import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: TextFormField(
        decoration: InputDecoration(),
      ),
    );
  }
}