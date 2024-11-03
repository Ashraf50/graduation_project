import 'package:flutter/material.dart';

class CustomOtpBoxWidget extends StatelessWidget {
  const CustomOtpBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 30,
      // padding: const EdgeInsets.symmetric(horizontal: 9),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 8,
            spreadRadius: 3,
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: const TextField(
        cursorColor: Color(0xffB6B5B5),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
