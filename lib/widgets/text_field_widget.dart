import 'package:flutter/material.dart';

class text_field_widget extends StatelessWidget {
  const text_field_widget({
    super.key,
    this.suffixIcon,
    this.controller,
    this.prefixIcon,
    this.obscureText,
    this.textInputType,
    this.enable,
    this.onChanged,
  });

  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? textInputType;
  final bool? enable;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        obscureText: obscureText!,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.white)),
          contentPadding: const EdgeInsets.fromLTRB(32, 10, 32, 16),
          filled: true,
          suffixIcon: suffixIcon,
          fillColor: Colors.white,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
