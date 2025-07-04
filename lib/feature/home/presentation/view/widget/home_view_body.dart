import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/recomendation_list_view.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/sliver_app_bar.dart';
import '../../../../../core/constant/function/get_responsive.dart';
import '../../../../../generated/l10n.dart';
import 'all_posts_list_view.dart';
import 'apartment_list_view.dart';
import 'room_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
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
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.primaryColor,
                scrolledUnderElevation: 0,
                pinned: true,
                floating: true,
                expandedHeight: getResponsiveHeight(screenHeight),
                flexibleSpace:
                    FlexibleSpaceBar(background: SliverAppBarWidget()),
                bottom: TabBar(
                  labelPadding: EdgeInsets.zero,
                  labelColor: Colors.white,
                  labelStyle: AppStyles.textStyle20notBold,
                  indicatorColor: AppColors.white,
                  unselectedLabelStyle: AppStyles.textStyle18White,
                  dividerHeight: 0,
                  tabs: [
                    Tab(text: S.of(context).all),
                    Tab(text: S.of(context).apartment),
                    Tab(text: S.of(context).room),
                    Tab(text: S.of(context).recomendation),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              AllPostsListView(),
              ApartmentListView(),
              RoomsListView(),
              RecomendationListView(),
            ],
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () async {
            context.push('/map');
          },
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(175, 0, 89, 79),
            radius: 30,
            child: SvgPicture.asset(
              'assets/img/location.svg',
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}
