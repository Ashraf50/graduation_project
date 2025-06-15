import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/function/build_account_image.dart';
import 'package:graduation_project/core/helper/api_helper.dart';

class AccountPhoto extends StatelessWidget {
  const AccountPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          context.push('/edit_profile');
          var response =
              await ApiHelper().get('http://stationone.ddns.net:54428/');
          log(response.toString());
        },
        child: buildAccountImage(radius: 25));
  }
}
