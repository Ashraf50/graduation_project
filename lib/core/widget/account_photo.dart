import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/helper/di.dart';

class AccountPhoto extends StatelessWidget {
  const AccountPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/edit_profile');
      },
      child: supabase.auth.currentUser?.userMetadata?['imageProfile'] == null
          ? CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.toastColor,
              child:
                  Text(supabase.auth.currentUser!.userMetadata?['userName'][0]))
          : CircleAvatar(
              radius: 25,
              backgroundImage: CachedNetworkImageProvider(
                  supabase.auth.currentUser?.userMetadata?['imageProfile']
                  //  const AssetImage('assets/img/profile.png'),
                  ),
            ),
    );
  }
}
