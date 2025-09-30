import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false, this.hintstyle,
  });

  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? obscureText;
  final TextStyle? hintstyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color.alphaBlend(
              Colors.greenAccent.withAlpha(120),
              Colors.transparent,
            ),
            blurRadius: 18,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
          suffixIconConstraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintstyle?? TextStyle(
            color: Color(0xffCBCBCB),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.greenAccent, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.greenAccent, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.greenAccent),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        ),
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
