import 'package:flutter/material.dart';
import 'package:graduation_project/core/helper/responsive_manager.dart';
import 'package:graduation_project/feature/Auth/presentation/view/page_view.dart/desktop_auth/auth_desktop_view_body.dart';
import 'package:graduation_project/feature/Auth/presentation/view/page_view.dart/sign_in/mobile_sign_in_view_body.dart';

class ResponsiveSignIn extends StatelessWidget {
  const ResponsiveSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveManager(
      mobileView: MobileSignInView(),
      tabletView: TabletSignInView(),
      desktopView: DesktopSignInView(),
    );
  }
}

class MobileSignInView extends StatelessWidget {
  const MobileSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileSignInViewBody();
  }
}

class TabletSignInView extends StatelessWidget {
  const TabletSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileSignInViewBody();
  }
}

class DesktopSignInView extends StatelessWidget {
  const DesktopSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthDesktopViewBody();
  }
}
