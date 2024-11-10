import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:provider/provider.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvide = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
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
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage("assets/img/test.jpg"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Ashraf Essam",
                        style: AppStyles.textStyle20notBold,
                      ),
                    ],
                  ),
                  MenuButton(),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: SelectableText(
                  "Clean Penthouse Bedroom, 26 sgm, with wih and tv entertainment (Android tv box). hundrads of channels of tv shows, movies, sports, Notflix and hot water",
                  style: AppStyles.textStyle18black,
                ),
              ),
              Image.asset(
                "assets/img/apartment.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Apartment",
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
                              "4.2",
                              style: AppStyles.textStyle16,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "400,000 EGP",
                      style: AppStyles.textStyle20,
                    ),
                    Text(
                      "New Cairo city, Cairo ",
                      style: AppStyles.textStyle16gray,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ApartmentProperties(
                              image: "assets/img/num_bed.svg",
                              title: "2",
                            ),
                            ApartmentProperties(
                              image: "assets/img/num_bathroom.svg",
                              title: "2",
                            ),
                            ApartmentProperties(
                              image: "assets/img/area.svg",
                              title: "130 m",
                            ),
                          ],
                        ),
                        CustomButton(
                          title: "View",
                          buttonColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                          width: 110,
                          onTap: () {},
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

class ApartmentProperties extends StatelessWidget {
  final String image;
  final String title;
  const ApartmentProperties({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvide = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            height: 18,
            colorFilter: ColorFilter.mode(
              themeProvide.isDarkTheme ? AppColors.white : AppColors.black,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            title,
            style: AppStyles.textStyle18black,
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'save') {
            print('Saved');
          }
        },
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem<String>(
              value: 'save',
              height: 25,
              textStyle: AppStyles.textStyle18black,
              child: Text('Save'),
            ),
          ];
        },
        child: Icon(Icons.more_horiz),
      ),
    );
  }
}
