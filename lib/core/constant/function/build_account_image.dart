import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../helper/di.dart';
import '../app_colors.dart';

Widget buildAccountImage({required double radius, Color? bgcolor}) {
  return supabase.auth.currentUser?.userMetadata?['imageProfile'] == null
      ? CircleAvatar(
          radius: radius,
          backgroundColor: bgcolor ?? AppColors.toastColor,
          child: Text(
            supabase.auth.currentUser!.userMetadata?['userName'][0],
            style: TextStyle(
              fontSize: radius <= 25 ? radius - 5 : radius / 2,
            ),
          ),
        )
      : CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(
              supabase.auth.currentUser?.userMetadata?['imageProfile']
              //  const AssetImage('assets/img/profile.png'),
              ),
        );
}
