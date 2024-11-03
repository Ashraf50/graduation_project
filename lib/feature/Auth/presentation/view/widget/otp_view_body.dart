import 'dart:math';

import 'package:flutter/material.dart';
 
import 'custom_paint_widget.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Transform.rotate(
          angle: pi,
          child: CustomPaint(
            size: Size(screenSize.width, screenSize.height * .5),
            foregroundPainter: CurvePainter(),
          ),
        ),
        // const TitleAndSubWidget(
        //     title: 'oTP verification',
        //     subTitle:
        //         'we will send you one-time password to your mobile number')
      ],
    );
  }
}

 