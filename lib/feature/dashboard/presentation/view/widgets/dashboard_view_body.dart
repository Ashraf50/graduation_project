import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/function/get_current_user.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/apartment_details_bottom_sheet.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_states.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/no_item_widget.dart';
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
  List<Flat> flats = [];
  int _currentIndex = 0;

  @override
  initState() {
    flatCubit = BlocProvider.of<FlatViewModel>(context);

    Future.sync(() {
      flatCubit.fetchFlatsByLandlordId(getCurrentUser().id);
    }).then((value) {
      flats = value as List<Flat>;
    });
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

  // final List<Widget> pages = [
  //   LandLoardHomeView(flats: flats),
  //   ApartmentDetailsBottomSheet(),
  //   Center(child: Text('Profile ')),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<FlatViewModel, FlatStates>(
        listener: (context, state) {
          if (state is AddingFlatSuccessState) {
            _currentIndex = 0;
            setState(() {});
          }
        },
        builder: (context, state) {
          List<Widget> pages;
          if (state is FetchingLandlordFlatsSuccessState) {
            pages = [
              LandLoardHomeView(flats: state.flats),
              ApartmentDetailsBottomSheet(),
              Center(child: Text('Profile')),
            ];
          } else {
            pages = [
              NoItemWidget(),
              ApartmentDetailsBottomSheet(),
              Center(child: Text('Profile')),
            ];
          }
          return pages[_currentIndex];
        },
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: onItemTapped,
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: Icon(size: 30, Icons.add),
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
