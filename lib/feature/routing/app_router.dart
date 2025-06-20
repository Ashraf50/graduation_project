import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:graduation_project/core/helper/responsive_manager.dart';
import 'package:graduation_project/core/widget/bottom_bar.dart';
import 'package:graduation_project/feature/Auth/presentation/view/page_view.dart/sign_up/complete_registeration.dart';
import 'package:graduation_project/feature/Auth/presentation/view/responsive_forget_pass.dart';
import 'package:graduation_project/feature/Auth/presentation/view/responsive_sign_up.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/reset_pass_responsive.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/responsive_finish_reset_pass.dart';

import 'package:graduation_project/feature/account/presentation/view/account_view.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/about_us_view.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/contact_us.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/edit_profile_view.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/language_view.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/privacy_policy.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/terms_and_condition.dart';
import 'package:graduation_project/feature/chat/presentation/view/chat_details_view.dart';

import 'package:graduation_project/feature/dashboard/presentation/view/dashboard_view.dart';
import 'package:graduation_project/feature/desktop/desktop_view.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/home/presentation/view/details_view.dart';
import 'package:graduation_project/feature/map/presentation/view/map_view.dart';
import 'package:graduation_project/feature/splash_screen/presentation/view/onboard_screen_view.dart';
import '../Auth/presentation/view/responsive_sign_in.dart';

class AppRouter {
  final bool isLoggedIn;
  AppRouter({required this.isLoggedIn});
  late final GoRouter router = GoRouter(
    // initialLocation: isLoggedIn ? '/bottomBar' : '/onboard',
    initialLocation: '/sign_up',
    //initialLocation: '/dashboard',
    routes: [
      GoRoute(
        path: '/onboard',
        builder: (context, state) => const OnboardScreen(),
      ),
      GoRoute(
        path: '/bottomBar',
        builder: (context, state) => const ResponsiveManager(
          mobileView: BottomBar(),
          tabletView: BottomBar(),
          desktopView: DesktopView(),
        ),
      ),
      GoRoute(
        path: '/sign_in',
        builder: (context, state) => const ResponsiveSignIn(),
      ),
      GoRoute(
        path: '/account_view',
        builder: (context, state) => const AccountView(),
      ),
      GoRoute(
        path: '/sign_up',
        builder: (context, state) => const ResponsiveSignUp(),
      ),
      GoRoute(
        path: '/complete_signUp',
        builder: (context, state) => const CompleteRegistration(),
      ),
      GoRoute(
        path: '/forget_pass',
        builder: (context, state) => const ResponsiveForgetPassword(),
      ),
      GoRoute(
        path: '/reset_pass',
        builder: (context, state) => const ResponsiveResetPasswordView(),
      ),
      GoRoute(
        path: '/finish_pass_view',
        builder: (context, state) => const ResponsiveFinishResetPassword(),
      ),
      GoRoute(
        path: '/language',
        builder: (context, state) => const LanguageView(),
      ),
      GoRoute(
        path: '/contact_us',
        builder: (context, state) => const ContactUs(),
      ),
      GoRoute(
        path: '/terms',
        builder: (context, state) => const TermsAndCondition(),
      ),
      GoRoute(
        path: '/privacy',
        builder: (context, state) => const PrivacyAndPolicy(),
      ),
      GoRoute(
        path: '/about_us',
        builder: (context, state) => const AboutUSView(),
      ),
      GoRoute(
        path: '/edit_profile',
        builder: (context, state) {
          final userData = supabase.auth.currentUser;
          return EditProfileView(
            userData: userData,
          );
        },
      ),
      GoRoute(
        path: '/chat_details',
        builder: (context, state) {
          final usersId = state.extra as String;

          return ChatDetailsView(usersId: usersId);
        },
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) {
          final flat = state.extra as Flat;
          return DetailsView(flat: flat);
        },
      ),
      GoRoute(
        path: '/map',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>?;
          return MapViewPage(
            lat: args?['lat'] as double?,
            lng: args?['lng'] as double?,
          );
        },
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardView(),
      ),
    ],
  );
}
