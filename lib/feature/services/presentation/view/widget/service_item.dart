import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/feature/services/data/model/services_model.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';

class ServiceItem extends StatelessWidget {
  final ServicesModel service;
  const ServiceItem({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: themeProvider.isDarkTheme
            ? AppColors.widgetColorDark
            : AppColors.whiteGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyWidget(
                  title: S.of(context).name,
                  supTitle: service.name!,
                ),
                MyWidget(
                  title: S.of(context).phone,
                  supTitle: service.phone ?? '',
                ),
                MyWidget(
                  title: S.of(context).working_hour,
                  supTitle: service.workingHours ?? '',
                ),
                MyWidget(
                    title: S.of(context).distance,
                    supTitle:
                        '${service.distanceMeters.toString()} ${S.of(context).m}'),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(175, 0, 89, 79),
              radius: 20,
              child: SvgPicture.asset(
                'assets/img/location.svg',
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String title;
  final String supTitle;
  const MyWidget({
    super.key,
    required this.title,
    required this.supTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            '$title:  ',
            style: AppStyles.textStyle20,
          ),
          Text(
            supTitle,
            style: AppStyles.textStyle18black,
          ),
        ],
      ),
    );
  }
}
