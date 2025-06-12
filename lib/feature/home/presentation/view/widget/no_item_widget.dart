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
      child: Center(child: SvgPicture.asset('assets/img/no_flats_yet.svg')),
    );
  }
}
