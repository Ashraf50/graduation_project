import 'package:flutter/material.dart';
import 'package:graduation_project/core/helper/responsive_manager.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/reset_pass_view.dart';

class ResponsiveResetPasswordView extends StatelessWidget {
  const ResponsiveResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveManager(
      mobileView: MobileResetView(),
      tabletView: TabletResetView(),
      desktopView: DesktopResetView(),
    );
  }
}

class MobileResetView extends StatelessWidget {
  const MobileResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileResetPasswordViewBody();
  }
}

class TabletResetView extends StatelessWidget {
  const TabletResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * .15),
      child: const MobileResetPasswordViewBody(),
    );
  }
}

class DesktopResetView extends StatelessWidget {
  const DesktopResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopResetPassViewBody();
  }
}
