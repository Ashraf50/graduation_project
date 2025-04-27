import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/widget/custom_toast.dart';
import 'package:graduation_project/feature/Auth/data/manager/auth_supabase_manager.dart';
import 'package:graduation_project/feature/account/presentation/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../constant/app_colors.dart';

class AccountPhoto extends StatelessWidget {
  const AccountPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/edit_profile');
      },
      child: CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(
              supabase.auth.currentUser?.userMetadata?['imageProfile'] ??
                  'https://i.pravatar.cc/300')
          //  const AssetImage('assets/img/profile.png'),
          ),
    );
  }
}
