import 'package:flutter/material.dart';
import 'package:graduation_project/core/helper/responsive_manager.dart';
import 'package:graduation_project/feature/Auth/presentation/view/page_view.dart/desktop_auth/auth_desktop_view_body.dart';
import 'page_view.dart/sign_up/mobile_sign_up_view_body.dart';

class ResponsiveSignUp extends StatelessWidget {
  const ResponsiveSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveManager(
      mobileView: MobileSignUpView(),
      tabletView: TabletSignUpView(),
      desktopView: DesktopSignUpView(),
    );
  }
}

class MobileSignUpView extends StatelessWidget {
  const MobileSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileSignUpViewBody();
  }
}

class TabletSignUpView extends StatelessWidget {
  const TabletSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileSignUpViewBody();
  }
}

class DesktopSignUpView extends StatelessWidget {
  const DesktopSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthDesktopViewBody();
  }
}
