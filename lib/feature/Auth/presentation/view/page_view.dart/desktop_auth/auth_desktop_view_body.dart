import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Auth/presentation/view/page_view.dart/desktop_auth/widget/desktop_sign_up_view.dart';
import 'package:graduation_project/generated/l10n.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_style.dart';
import '../../../../../../core/widget/custom_scaffold.dart';
import 'widget/desktop_forget_pass_view.dart';
import 'widget/desktop_sign_in_view.dart';

class AuthDesktopViewBody extends StatelessWidget {
  const AuthDesktopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CustomScaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .18),
          child: Column(
            children: [
              TabBar(
                labelPadding: EdgeInsets.zero,
                labelColor: AppColors.primaryColor,
                labelStyle: AppStyles.textStyle20notBold,
                indicatorColor: AppColors.primaryColor,
                unselectedLabelStyle: AppStyles.textStyle18black,
                dividerHeight: 0,
                tabs: [
                  Tab(text: S.of(context).login),
                  Tab(text: S.of(context).sign_up),
                  Tab(text: S.of(context).reset_pass),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: const [
                    DesktopSignInView(),
                    DesktopSignUpView(),
                    DesktopForgetPassView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
