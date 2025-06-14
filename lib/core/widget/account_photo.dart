import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/function/build_account_image.dart';
import 'package:graduation_project/core/helper/di.dart';

class AccountPhoto extends StatelessWidget {
  const AccountPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.push('/edit_profile');
        },
        child: buildAccountImage(radius: 25));
  }
}
