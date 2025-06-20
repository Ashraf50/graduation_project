import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';

class NoItemWidget extends StatelessWidget {
  const NoItemWidget({
    super.key,
    this.message,
  });
  final String? message;
  @override
  Widget build(BuildContext context) {
    log(message.toString());
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/not_item_yet.jpg'),
          Text(message ?? 'No Flats Yet'),
        ],
      ),
    );
  }
}
