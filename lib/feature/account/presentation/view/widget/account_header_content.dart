import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/custom_toast.dart';
import 'package:graduation_project/core/widget/shimmer_loading.dart';
import 'package:graduation_project/feature/account/presentation/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:provider/provider.dart';
import 'account_header_widget.dart';

class AccountHeaderContent extends StatelessWidget {
  const AccountHeaderContent({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataSuccess) {
          return AccountHeaderWidget(
            name: state.userData.username,
            image: state.userData.profileImage!,
            onTap: () {
              context.push('/edit_profile', extra: state.userData);
            },
          );
        } else if (state is UserDataFailure) {
          CustomToast.show(
            message: state.errMessage,
            backgroundColor: Colors.red,
          );
        } else if (state is UserDataLoading) {
          return ShimmerLoading(
            height: 100,
            width: double.infinity,
            baseColor:
                theme.isDarkTheme ? AppColors.widgetColorDark : AppColors.grey,
            highlightColor: theme.isDarkTheme
                ? const Color.fromARGB(36, 158, 158, 158)
                : AppColors.whiteGrey,
          );
        }
        return AccountHeaderWidget(
          name: 'UnKnown',
          image:
              'https://scontent-hbe1-2.xx.fbcdn.net/v/t1.30497-1/453178253_471506465671661_2781666950760530985_n.png?stp=dst-png_s720x720&_nc_cat=1&ccb=1-7&_nc_sid=136b72&_nc_ohc=0ePt_zi8Td0Q7kNvgFWky6D&_nc_zt=24&_nc_ht=scontent-hbe1-2.xx&_nc_gid=AHyqPshHV-j9m9B0673rWcp&oh=00_AYBdz-14TRBvB-7DyUWN-rxnO8y4ktQXW8bTItfpcVlInQ&oe=676C38BA',
          onTap: () {},
        );
      },
    );
  }
}
