import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/constant/function/build_account_image.dart';
import 'package:graduation_project/core/constant/function/get_current_user.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/post_item.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';

class ApartmentItem extends StatelessWidget {
  const ApartmentItem({super.key, required this.flat});
  final Flat flat;
  @override
  Widget build(BuildContext context) {
    final themeProvide = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: themeProvide.isDarkTheme
                ? AppColors.widgetColorDark
                : AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // CircleAvatar(
                      //   radius: isLargeScreen ? 30 : 25,
                      //   backgroundImage: AssetImage('assets/img/terms.svg'),
                      // ),
                      buildAccountImage(
                          radius: 25,
                          bgcolor: AppColors.primaryColor.withBlue(80)),
                      SizedBox(width: isLargeScreen ? 15 : 10),
                      Text(
                        getCurrentUser().userMetadata?['userName'],
                        style: AppStyles.textStyle20notBold,
                      ),
                    ],
                  ),
                  MenuButton(),
                ],
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Apartment',
                          style: AppStyles.textStyle16gray,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xffF8B84E),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '4.2',
                              style: AppStyles.textStyle16,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '400,000 EGP',
                      style: AppStyles.textStyle20,
                    ),
                    Text(
                      'New Cairo city, Cairo',
                      style: AppStyles.textStyle16gray,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            ApartmentProperties(
                              image: 'assets/img/num_bed.svg',
                              title: '2',
                            ),
                            ApartmentProperties(
                              image: 'assets/img/num_bathroom.svg',
                              title: '2',
                            ),
                            ApartmentProperties(
                              image: 'assets/img/area.svg',
                              title: '130 m',
                            ),
                          ],
                        ),
                        CustomButton(
                          title: S.of(context).view,
                          buttonColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                          width: 110,
                          onTap: () {
                            context.push('/details');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
