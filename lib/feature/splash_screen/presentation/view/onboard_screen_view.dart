import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/sign_in_view.dart';
import 'package:graduation_project/feature/Auth/presentation/view/sign_up_view.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'first_screen_view.dart';
import 'second_screen_view.dart';
import 'third_screen_view.dart';
import 'widget/custom_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: _controller,
              children: const [
                FirstScreen(),
                SecondScreen(),
                ThirdScreen(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIndicator(active: index == 0),
              const SizedBox(width: 5),
              CustomIndicator(active: index == 1),
              const SizedBox(width: 5),
              CustomIndicator(active: index == 2),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const SignUpView());
                  },
                  child: Text(
                    index == 2 ? S.of(context).Register : S.of(context).skip,
                    style: AppStyles.textStyle20,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    if (index == 2) {
                      Get.to(() => const SignInView());
                    } else {
                      _controller.animateToPage(index + 1,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      index == 2 ? S.of(context).login : S.of(context).next,
                      style: AppStyles.textStyle18White,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
