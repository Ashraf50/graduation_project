import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? const Color(0xffA1D4AC) : Colors.grey,
      ),
      width: active ? 20 : 10,
      height: 10,
    );
  }
}
