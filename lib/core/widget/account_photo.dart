import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widget/custom_snack_bar.dart';
import 'package:graduation_project/feature/account/presentation/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../generated/l10n.dart';
import '../constant/app_colors.dart';

class AccountPhoto extends StatelessWidget {
  const AccountPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataSuccess) {
          return CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(state.userData.image),
          );
        } else if (state is UserDataFailure) {
          SnackbarHelper.showCustomSnackbar(
            context: context,
            title: S.of(context).error,
            message: state.errMessage,
            contentType: ContentType.failure,
          );
        } else {
          return Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.whiteGrey,
            child: CircleAvatar(
              radius: 25,
            ),
          );
        }
        return CircleAvatar(
          radius: 25,
          backgroundImage: const AssetImage('assets/img/profile.png'),
        );
      },
    );
  }
}
