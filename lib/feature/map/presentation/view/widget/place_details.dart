import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/app_theme.dart';
import '../../../data/model/places_model/places_model.dart';

class PlaceDetails extends StatelessWidget {
  final PlacesModel place;
  const PlaceDetails({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              place.title!,
              style: AppStyles.textStyle20,
            )),
            CustomWidget(
              icon: Icons.location_city,
              title: "${S.of(context).country}: ",
              subTitle: place.address?.county! ?? "",
            ),
            CustomWidget(
              icon: Icons.language,
              title: "${S.of(context).country_name}: ",
              subTitle: place.address!.countryName!,
            ),
            CustomWidget(
              icon: Icons.location_on_outlined,
              title: "${S.of(context).address}: ",
              subTitle: place.address?.label ?? "",
            ),
            CustomWidget(
              icon: Icons.code_sharp,
              title: "${S.of(context).country_code}: ",
              subTitle: place.address!.countryCode!,
            ),
            CustomWidget(
              icon: Icons.directions_outlined,
              title: "${S.of(context).distance}: ",
              subTitle: "${((place.distance)! / 1000).toString()} KM/H",
            ),
            CustomWidget(
              icon: Icons.category_outlined,
              title: "${S.of(context).category}: ",
              subTitle: place.categories?[0].name ?? "UnKnown",
            ),
            CustomWidget(
              icon: Icons.phone,
              title: "${S.of(context).contact}: ",
              subTitle: place.contacts?[0].phone?[0].value ?? "no phones",
            ),
            CustomWidget(
              icon: Icons.email_outlined,
              title: "${S.of(context).email}: ",
              subTitle: place.contacts?[0].email?[0].value ?? "no Emails",
            ),
            CustomWidget(
              icon: Icons.web,
              title: "${S.of(context).www}: ",
              subTitle: place.contacts?[0].www?[0].value ?? "no www",
            ),
            CustomWidget(
              icon: Icons.access_time,
              title: "${S.of(context).opening_h}: ",
              subTitle: place.openingHours?[0].text?[0] ?? "--",
            ),
            CustomWidget(
              icon: Icons.check_circle_outlined,
              title: "${S.of(context).is_opened}: ",
              subTitle: place.openingHours?[0].isOpen.toString() ?? "--",
            )
          ],
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  const CustomWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: theme.isDarkTheme ? AppColors.white : AppColors.black,
        ),
        Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            title,
            style: AppStyles.textStyle20notBold,
          ),
        ),
        Expanded(
          child: SelectableText(
            subTitle,
            style: AppStyles.textStyle18black,
          ),
        )
      ],
    );
  }
}
