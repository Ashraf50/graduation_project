import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/model/services_model.dart';

class ServiceCard extends StatelessWidget {
  final ServicesModel service;
  const ServiceCard({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
      color: themeProvider.isDarkTheme
          ? AppColors.widgetColorDark
          : AppColors.whiteGrey,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              service.name!,
              style: AppStyles.textStyle20,
            ),
            const SizedBox(height: 12),
            MyWidget(
              title: service.phone ?? S.of(context).no_phone,
              icon: Icons.phone,
            ),
            const SizedBox(height: 12),
            MyWidget(
              title: service.workingHours ?? S.of(context).no_working,
              icon: Icons.access_time,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyWidget(
                  title:
                      '${service.distanceMeters.toString()} ${S.of(context).m}',
                  icon: Icons.location_on,
                ),
                InkWell(
                  onTap: () {
                    context.push('/map', extra: {
                      'lat': service.latitude,
                      'lng': service.longitude,
                    });
                  },
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
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const MyWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey[700],
        ),
        const SizedBox(width: 8),
        SelectableText(
          title,
          style: AppStyles.textStyle16gray,
        ),
      ],
    );
  }
}
