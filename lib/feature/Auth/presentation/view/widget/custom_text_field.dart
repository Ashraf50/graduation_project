import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  const CustomTextfield({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffBCB8B1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffBCB8B1)),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
