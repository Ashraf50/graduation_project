import 'package:flutter/material.dart';
import 'package:graduation_project/core/helper/responsive_manager.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/finish_reset_pass_view.dart';

class ResponsiveFinishResetPassword extends StatelessWidget {
  const ResponsiveFinishResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveManager(
      mobileView: MobileForgetPasswordView(),
      tabletView: TabletForgetPasswordView(),
      desktopView: DesktopForgetPasswordView(),
    );
  }
}

class MobileForgetPasswordView extends StatelessWidget {
  const MobileForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileFinishResetPassViewBody();
  }
}

class TabletForgetPasswordView extends StatelessWidget {
  const TabletForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileFinishResetPassViewBody();
  }
}

class DesktopForgetPasswordView extends StatelessWidget {
  const DesktopForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopFinishPasswordViewBody();
  }
}
