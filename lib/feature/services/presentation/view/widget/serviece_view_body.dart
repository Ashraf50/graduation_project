import 'package:flutter/material.dart';
import 'package:graduation_project/feature/services/presentation/view/widget/banks_list_view.dart';
import 'package:graduation_project/feature/services/presentation/view/widget/cafes_list_view.dart';
import 'package:graduation_project/feature/services/presentation/view/widget/hosiptal_list_view.dart';
import 'package:graduation_project/feature/services/presentation/view/widget/restaurant_list_view.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_style.dart';
import '../../../../../core/constant/function/get_responsive.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/presentation/view/widget/all_posts_list_view.dart';
import '../../../../home/presentation/view/widget/apartment_list_view.dart';
import '../../../../home/presentation/view/widget/room_list_view.dart';
import '../../../../home/presentation/view/widget/sliver_app_bar.dart';
import 'services_app_bar.dart';

class ServicesViewBody extends StatelessWidget {
  const ServicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return DefaultTabController(
      length: 4,
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
                expandedHeight: 130,
                flexibleSpace: FlexibleSpaceBar(background: ServicesAppBar()),
                bottom: TabBar(
                  labelPadding: EdgeInsets.zero,
                  labelColor: Colors.white,
                  labelStyle: AppStyles.textStyle20notBold,
                  indicatorColor: AppColors.white,
                  unselectedLabelStyle: AppStyles.textStyle18White,
                  dividerHeight: 0,
                  tabs: [
                    Tab(text: S.of(context).hospitals),
                    Tab(text: S.of(context).cafes),
                    Tab(text: S.of(context).banks),
                    Tab(text: S.of(context).restaurants),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              HosiptalListView(),
              CafesListView(),
              BanksListView(),
              RestaurantListView(),
            ],
          ),
        ),
      ),
    );
  }
}
