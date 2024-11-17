import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double radius;
  final TextEditingController? controller;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? style;
  final Color cursorColor;
  final Color focusedColor;
  final Color enabledColor;

  final void Function(String)? onSubmitted;
  const SearchTextField({
    super.key,
    this.suffixIcon,
    this.controller,
    required this.hintText,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    required this.radius,
    this.style,
    required this.cursorColor,
    this.onSubmitted,
    required this.focusedColor,
    required this.enabledColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        cursorColor: cursorColor,
        onSubmitted: onSubmitted,
        style: style,
        decoration: InputDecoration(
          filled: filled,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: enabledColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: focusedColor,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
