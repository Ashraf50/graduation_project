import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/function/get_current_user.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/edit_profile_view.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/apartment_details_bottom_sheet.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_states.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../../flat/presentation/view_model/flat_view_model.dart';
import 'landlord_home_view.dart';

class DashboardViewBody extends StatefulWidget {
  const DashboardViewBody({super.key});

  @override
  State<DashboardViewBody> createState() => _DashboardViewBodyState();
}

class _DashboardViewBodyState extends State<DashboardViewBody> {
  late FlatViewModel flatCubit;
  // List<Flat> flats = [];
  int _currentIndex = 0;
  // List<Widget> pages = [];
  List<Widget> pages = [
    LandLoardHomeView(),
    ApartmentDetailsBottomSheet(),
    EditProfileView(),
    // Center(child: Text('Profile')),
  ];

  @override
  initState() {
    flatCubit = BlocProvider.of<FlatViewModel>(context);

    super.initState();
  }

  onItemTapped(int index) {
    if (index == 2) {
      getCurrentUser();
    }
    log('Tapped index: $index');
    log('Current index: $_currentIndex');
    setState(() {
      _currentIndex = index;
    });
    log('Current index after: $_currentIndex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocListener<FlatViewModel, FlatStates>(
        listener: (context, state) {
          if (state is AddingFlatSuccessState) {
            SmartDialog.dismiss();
            _currentIndex = 0;
            setState(() {});
          }
        },
        child: pages[_currentIndex],
      ),
      // body: BlocConsumer<FlatViewModel, FlatStates>(
      //   listener: (context, state) {
      //     if (state is AddingFlatSuccessState) {
      //       _currentIndex = 0;
      //       setState(() {});
      //     }
      //   },
      //   builder: (context, state) {
      //     SmartDialog.dismiss();

      //     if (state is FetchingLandlordFlatsSuccessState) {
      //       SmartDialog.dismiss();
      //       pages = [
      //         LandLoardHomeView(),
      //         ApartmentDetailsBottomSheet(),
      //         Center(child: Text('Profile')),
      //       ];
      //     } else if (state is FetchingLandlordFlatsLoadingState) {
      //       SmartDialog.showLoading(
      //           useAnimation: true, alignment: Alignment.center);
      //       pages = [
      //         Center(
      //           child: Container(
      //             color: AppColors.white,
      //           ),
      //         ),
      //         ApartmentDetailsBottomSheet(),
      //         Center(child: Text('Profile')),
      //       ];
      //     } else {
      //       pages = [
      //         NoItemWidget(),
      //         ApartmentDetailsBottomSheet(),
      //         Center(child: Text('Profile')),
      //       ];
      //     }
      //     return pages[_currentIndex];
      //   },
      // ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: onItemTapped,
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              Icons.home,
              // color: AppColors.white,
              size: 30,
            ),
            title: Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              size: 30,
              Icons.add,
            ),
            title: Text('Add Flat'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              size: 30,
            ),
            title: Text('profile'),
          ),
        ],
      ),
    );
  }
}
