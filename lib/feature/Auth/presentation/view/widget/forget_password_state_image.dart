import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordStateImage extends StatelessWidget {
  const ForgetPasswordStateImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(image),
    );
  }
}
