import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_strings.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/constant/function/build_account_image.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.flat, required this.flatType});
  final Flat flat;
  final String flatType;
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
                      buildAccountImage(
                          radius: 25, landlordName: flat.landlordName![0]),
                      SizedBox(width: isLargeScreen ? 15 : 10),
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: Text(
                          flat.landlordName ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: AppStyles.textStyle20notBold,
                        ),
                      ),
                    ],
                  ),
                  // MenuButton(),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: SelectableText(
                  // 'Clean Penthouse Bedroom, 26 sgm, with wih and tv entertainment (Android tv box). hundrads of channels of tv shows, movies, sports, Notflix and hot water',
                  flat.description ?? 'Apartment Name',
                  textAlign: TextAlign.left,

                  style: AppStyles.textStyle18black,
                ),
              ),
              SizedBox(
                height: 200,
                width: screenWidth - 20,
                child: Image.network(
                  loadingBuilder: (context, child, loadingProgress) {
                    return child;
                  },
                  flat.imagesUrl == null
                      ? AppStrings.noImageUrl
                      : flat.imagesUrl!.isEmpty
                          ? AppStrings.noImageUrl
                          : flat.imagesUrl![0],
                  fit: BoxFit.cover,
                ),
                // child: CircleAvatar(
                //   backgroundColor: flat.imagesUrl == null
                //       ? AppStrings.noImageUrl
                //       : flat.imagesUrl!.isEmpty
                //           ? AppStrings.noImageUrl
                //           : CachedNetworkImageProvider(flat.imagesUrl![0]),
                // ),
              ),
              // Image.asset(
              //   'assets/img/apartment.png',
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          flatType,
                          style: AppStyles.textStyle16gray,
                        ),
                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.star,
                        //       color: Color(0xffF8B84E),
                        //     ),
                        //     SizedBox(width: 4),
                        //     Text(
                        //       flat.space.toString(),
                        //       style: AppStyles.textStyle16,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    Text(
                      '${flat.price} EGP',
                      style: AppStyles.textStyle20,
                    ),
                    Text(
                      flat.description ?? 'Apartment Description',
                      style: AppStyles.textStyle16gray,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ApartmentProperties(
                              image: 'assets/img/num_bed.svg',
                              title: flat.numRooms.toString(),
                            ),
                            ApartmentProperties(
                              image: 'assets/img/num_bathroom.svg',
                              title: flat.numBathroom.toString(),
                            ),
                            ApartmentProperties(
                              image: 'assets/img/area.svg',
                              title: '${flat.space} m',
                            ),
                          ],
                        ),
                        CustomButton(
                          title: S.of(context).view,
                          buttonColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                          width: 110,
                          onTap: () {
                            // getLandLordById(flat.landlordId!);
                            context.push('/details', extra: flat);
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
      padding: EdgeInsets.only(right: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            height: 20,
            colorFilter: ColorFilter.mode(
              themeProvide.isDarkTheme ? AppColors.white : AppColors.black,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 4),
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Theme(
        data: Theme.of(context).copyWith(
          popupMenuTheme: PopupMenuThemeData(
            color: themeProvider.isDarkTheme
                ? AppColors.widgetColorDark
                : AppColors.whiteGrey,
          ),
        ),
        child: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'save') {
              print('Saved');
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: S.of(context).save,
                height: 25,
                textStyle: AppStyles.textStyle18black,
                child: Text(S.of(context).save),
              ),
            ];
          },
          child: Icon(Icons.more_horiz),
        ),
      ),
    );
  }
}
