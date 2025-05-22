import 'package:flutter/material.dart';
import 'package:notti/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.isTitle = false,
  });
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isTitle;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: Colors.white,
      style: TextStyle(
        fontFamily:
            Helper().isArabic(controller.text) ? "Playpen Sans Arabic" : "Acme",
        color: Colors.white,
        fontSize: isTitle ? 24 : 16,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      ),
      maxLength: isTitle ? 30 : null,
      minLines: 1,
      maxLines: null,
      decoration: InputDecoration(
        hintText: isTitle ? "Heading" : "Type something...",
        hintStyle: TextStyle(
          color: Colors.white38,
          fontSize: isTitle ? 40 : 15,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
