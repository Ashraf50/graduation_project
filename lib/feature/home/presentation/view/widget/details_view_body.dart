import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/helper/chat_helper.dart';
import 'package:graduation_project/core/services/recomendation/cubit/ai_recomendation_cubit.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/facility_item.dart';
import '../../../../../core/helper/di.dart';
import '../../../../../generated/l10n.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.flat});
  final Flat flat;
  @override
  Widget build(BuildContext context) {
    // final String currentUserId = supabase.auth.currentUser!.id;

    double screenWidth = MediaQuery.of(context).size.width;
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).details),
      floatingActionButton: InkWell(
          onTap: () {
            log('from  details view landlord id : ${flat.landlordId}');
            log('from  details view current user id : ${supabase.auth.currentUser!.id}');
            context.push(
              '/chat_details',
              extra: flat.landlordId!,
            );
// supabase.auth.currentUser!.id;
          },
          child: CircleAvatar(
            // backgroundColor: const Color.fromARGB(175, 0, 89, 79),
            backgroundColor: AppColors.primaryColor,
            radius: 30,
            child: SvgPicture.asset(
              'assets/img/chat.svg',
              height: 30,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              // color: AppColors.white,
            ),
          )),
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
              'Nubaria, first section ',
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
