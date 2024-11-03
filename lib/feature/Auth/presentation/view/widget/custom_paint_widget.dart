import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // print(size.height.toString());
    var paint = Paint()
      ..color = AppColors.primaryColor
      ..strokeWidth = 4;

    var path = Path();

    path.moveTo(0, size.height * .5);

    path.quadraticBezierTo(
      size.width * 0.001,
      size.height * .88,
      size.width * 0.6,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * .8,
      size.height * 0.1,
      size.width * 1.0,
      size.height * 0.3,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

 