import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/all_apartments_list_view.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/apartment_details_bottom_sheet.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: NestedScrollView(
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
        body: AllApartmentsListView(),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return ApartmentDetailsBottomSheet();
            },
          );
        },
        child: CircleAvatar(
            backgroundColor: const Color.fromARGB(175, 0, 89, 79),
            radius: 30,
            child: Icon(Icons.add)),
      ),
    );
  }
}
