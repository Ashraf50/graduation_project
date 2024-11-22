import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/core/widget/shimmer_loading.dart';
import 'package:graduation_project/core/widget/custom_snack_bar.dart';
import 'package:graduation_project/feature/account/data/repos/user_repo_impl.dart';
import 'package:graduation_project/feature/account/presentation/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/function/get_token.dart';
import 'account_header_widget.dart';

class AccountHeaderContent extends StatelessWidget {
  const AccountHeaderContent({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return FutureBuilder<String?>(
      future: getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ShimmerLoading(
            height: 100,
            width: double.infinity,
            baseColor:
                theme.isDarkTheme ? AppColors.widgetColorDark : AppColors.grey,
            highlightColor: theme.isDarkTheme
                ? const Color.fromARGB(36, 158, 158, 158)
                : AppColors.whiteGrey,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final token = snapshot.data ?? '';
          return BlocProvider(
            create: (context) =>
                UserDataCubit(UserRepoImpl(ApiHelper()))..fetchUserData(token),
            child: BlocBuilder<UserDataCubit, UserDataState>(
              builder: (context, state) {
                if (state is UserDataSuccess) {
                  return AccountHeaderWidget(
                      name: state.userData.name,
                      image: state.userData.image,
                      onTap: () {
                        context.push('/edit_profile', extra: state.userData);
                      });
                } else if (state is UserDataFailure) {
                  SnackbarHelper.showCustomSnackbar(
                    context: context,
                    title: 'Failure!',
                    message: state.errMessage,
                    contentType: ContentType.failure,
                  );
                }
                return ShimmerLoading(
                  height: 100,
                  width: double.infinity,
                  baseColor: theme.isDarkTheme
                      ? AppColors.widgetColorDark
                      : AppColors.grey,
                  highlightColor: theme.isDarkTheme
                      ? const Color.fromARGB(36, 158, 158, 158)
                      : AppColors.whiteGrey,
                );
              },
            ),
          );
        }
      },
    );
  }
}
