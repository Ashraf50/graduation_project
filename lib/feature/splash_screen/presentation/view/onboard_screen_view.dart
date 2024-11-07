import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
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
                    context.push('/sign_up');
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
                      context.push('/sign_in');
                    } else {
                      _controller.animateToPage(index + 1,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
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
