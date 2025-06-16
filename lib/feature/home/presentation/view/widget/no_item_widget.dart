import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constant/app_colors.dart';

class NoItemWidget extends StatelessWidget {
  const NoItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/not_item_yet.jpg'),
          Text('No Flats Yet'),
        ],
      ),
    );
  }
}
