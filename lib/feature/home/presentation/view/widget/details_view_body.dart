import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/facility_item.dart';
import '../../../../../generated/l10n.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.flat});
  final Flat flat;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).details),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              child: Row(
                children: flat.imagesUrl!
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.only(right: 8),
                        // padding: const EdgeInsets.only(bottom: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  e,
                                  // fit: BoxFit.cover,
                                ))),
                        height: 300,
                        width: screenWidth - 40,
                      ),
                    )
                    .toList(),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 14),
            //   child: Image.asset(
            //     'assets/img/apart_test.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(height: 16),
            Text(
              flat.getFlatType(),
              style: AppStyles.textStyle18black,
            ),
            SizedBox(height: 8),
            Text(
              '${flat.price}EGP',
              style: AppStyles.textStyle20,
            ),
            SizedBox(height: 8),
            Text(
              'New Cairo city, Cairo ',
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
                    image: 'assets/img/num_bed.svg',
                    title: '${flat.numRooms} bedrooms',
                  ),
                  FacilityItem(
                    image: 'assets/img/num_bathroom.svg',
                    title: '${flat.numBathroom} bathroom',
                  ),
                  FacilityItem(
                    image: 'assets/img/area.svg',
                    title: '${flat.space} M',
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
              flat.description ?? 'no description',
              style: AppStyles.textStyle18black,
            ),
          ],
        ),
      ),
    );
  }
}
