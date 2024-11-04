import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/widget/botom_bar.dart';
import 'package:graduation_project/feature/Auth/presentation/view/forget_password_view.dart';
import 'package:graduation_project/feature/Auth/presentation/view/sign_in_view.dart';
import 'package:graduation_project/feature/Auth/presentation/view/sign_up_view.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/reset_pass_view.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/about_us_view.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/contact_us.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/edit_profile_view.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/language_view.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/privacy_policy.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/terms_and_condition.dart';
import 'package:graduation_project/feature/splash_screen/presentation/view/onboard_screen_view.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/onboard',
    routes: [
      GoRoute(
        path: "/onboard",
        builder: (context, state) => OnboardScreen(),
      ),
      GoRoute(
        path: '/sign_in',
        builder: (context, state) => SignInView(),
      ),
      GoRoute(
        path: '/sign_up',
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: '/bottomBar',
        builder: (context, state) => BottomBar(),
      ),
      GoRoute(
        path: '/language',
        builder: (context, state) => LanguageView(),
      ),
      GoRoute(
        path: '/contact_us',
        builder: (context, state) => ContactUs(),
      ),
      GoRoute(
        path: '/terms',
        builder: (context, state) => TermsAndCondition(),
      ),
      GoRoute(
        path: '/privacy',
        builder: (context, state) => PrivacyAndPolicy(),
      ),
      GoRoute(
        path: '/about_us',
        builder: (context, state) => AboutUSView(),
      ),
      GoRoute(
        path: '/forget_pass',
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: '/reset_pass',
        builder: (context, state) => ResetPasswordView(),
      ),
      GoRoute(
        path: '/edit_profile',
        builder: (context, state) => EditProfileView(),
      ),
    ],
  );
}
