import 'package:flutter/material.dart';
import 'package:graduation_project/core/helper/responsive_manager.dart';
import 'package:graduation_project/feature/Auth/presentation/view/page_view.dart/desktop_auth/auth_desktop_view_body.dart';
import 'page_view.dart/forget_pass/mobile_forget_pass_view_body.dart';

class ResponsiveForgetPassword extends StatelessWidget {
  const ResponsiveForgetPassword({super.key});

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
    return const MobileForgetPasswordViewBody();
  }
}

class TabletForgetPasswordView extends StatelessWidget {
  const TabletForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileForgetPasswordViewBody();
  }
}

class DesktopForgetPasswordView extends StatelessWidget {
  const DesktopForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthDesktopViewBody();
  }
}
