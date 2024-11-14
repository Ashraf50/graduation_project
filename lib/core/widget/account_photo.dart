import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/function/get_token.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/core/widget/show_snackbar.dart';
import 'package:graduation_project/feature/account/presentation/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../constant/app_colors.dart';
import '../../feature/account/data/repos/user_repo_impl.dart';

class AccountPhoto extends StatelessWidget {
  const AccountPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final token = snapshot.data ?? "";
          return BlocProvider(
            create: (context) =>
                UserDataCubit(UserRepoImpl(ApiHelper()))..fetchUserData(token),
            child: BlocBuilder<UserDataCubit, UserDataState>(
              builder: (context, state) {
                if (state is UserDataSuccess) {
                  return CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        CachedNetworkImageProvider(state.userData.image),
                  );
                } else if (state is UserDataFailure) {
                  showSnackbar(context, state.errMessage);
                } else {
                  return Shimmer.fromColors(
                    baseColor: AppColors.grey,
                    highlightColor: AppColors.whiteGrey,
                    child: CircleAvatar(
                      radius: 30,
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          );
        }
        return Text("error");
      },
    );
  }
}
