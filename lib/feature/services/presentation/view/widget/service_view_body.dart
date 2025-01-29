import 'package:flutter/material.dart';
import 'package:graduation_project/feature/services/presentation/view/widget/banks_list_view.dart';
import 'package:graduation_project/feature/services/presentation/view/widget/cafes_list_view.dart';
import 'package:graduation_project/feature/services/presentation/view/widget/pharmacies_list_view.dart';
import 'package:graduation_project/feature/services/presentation/view/widget/restaurant_list_view.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_style.dart';
import '../../../../../generated/l10n.dart';
import 'hospital_list_view.dart';
import 'services_app_bar.dart';

class ServicesViewBody extends StatelessWidget {
  const ServicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: AppColors.primaryColor,
                scrolledUnderElevation: 0,
                pinned: true,
                floating: true,
                expandedHeight: 120,
                flexibleSpace: FlexibleSpaceBar(background: ServicesAppBar()),
                bottom: TabBar(
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  labelColor: Colors.white,
                  labelStyle: AppStyles.textStyle20notBold,
                  indicatorColor: AppColors.white,
                  unselectedLabelStyle: AppStyles.textStyle18White,
                  dividerHeight: 0,
                  tabs: [
                    Tab(text: S.of(context).restaurants),
                    Tab(text: S.of(context).cafes),
                    Tab(text: S.of(context).banks),
                    Tab(text: S.of(context).pharmacy),
                    Tab(text: S.of(context).hospitals),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              RestaurantListView(),
              CafesListView(),
              BanksListView(),
              PharmaciesListView(),
              HospitalsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
