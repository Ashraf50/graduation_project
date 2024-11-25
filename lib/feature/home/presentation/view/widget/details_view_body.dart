import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/facility_item.dart';

import '../../../../../generated/l10n.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).details),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Image.asset(
                "assets/img/apart_test.png",
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Apartment",
              style: AppStyles.textStyle18black,
            ),
            SizedBox(height: 8),
            Text(
              "400,000 EGP",
              style: AppStyles.textStyle20,
            ),
            SizedBox(height: 8),
            Text(
              "New Cairo city, Cairo ",
              style: AppStyles.textStyle16gray,
            ),
            SizedBox(height: 30),
            Text(
              S.of(context).facility,
              style: AppStyles.textStyle24,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  FacilityItem(
                    image: "assets/img/num_bed.svg",
                    title: "2 bedrooms",
                  ),
                  FacilityItem(
                    image: "assets/img/num_bathroom.svg",
                    title: "2 bathroom",
                  ),
                  FacilityItem(
                    image: "assets/img/area.svg",
                    title: "130 M",
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              S.of(context).description,
              style: AppStyles.textStyle24,
            ),
            Text(
              "Clean Penthouse Bedroom, 26 sgm, with wih and tv entertainment (Android tv box). hundrads of channels of tv shows, movies, sports, Notflix and hot water,",
              style: AppStyles.textStyle18black,
            ),
          ],
        ),
      ),
    );
  }
}
