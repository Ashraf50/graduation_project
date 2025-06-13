import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_style.dart';
import 'all_apartments_list_view.dart';

class LandLoardHomeView extends StatelessWidget {
  const LandLoardHomeView({
    super.key, required this.flats,
  });
  final List<Flat> flats ;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(
              'Landlord Dashboard',
              style: AppStyles.textStyle18White,
            ),
            centerTitle: true,
            scrolledUnderElevation: 0,
            pinned: true,
            floating: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: AppColors.white,
                ),
                onPressed: () {
                  context.push('/account_view');
                },
              ),
            ],
          ),
        ];
      },
      body: AllApartmentsListView(flats: flats,),
    );
  }
}
