import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/all_apartments_list_view.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/apartment_details_bottom_sheet.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../../flat/data/manager/flat_supabase_manager.dart';
import '../../../../flat/data/repository/data_source/flat_supabase_data_source_impl.dart';
import '../../../../flat/data/repository/repo/flat_repo_impl.dart';
import '../../../../flat/domain/use_case/add_flat_with_image_use_case.dart';
import '../../../../flat/presentation/view_model/flat_view_model.dart';

class DashboardViewBody extends StatefulWidget {
  const DashboardViewBody({super.key});

  @override
  State<DashboardViewBody> createState() => _DashboardViewBodyState();
}

class _DashboardViewBodyState extends State<DashboardViewBody> {
  int _currentIndex = 0;
  onItemTapped(int index) {
    log('Tapped index: $index');
    log('Current index: $_currentIndex');
    setState(() {
      _currentIndex = index;
    });
    log('Current index after: $_currentIndex');
  }

  final List<Widget> pages = [
    LandLoardFlatsView(),
    Center(child: Text("Add Flat Page")),
    Center(child: Text("Profile Page")),
  ];
  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.sizeOf(context).height;
    // final themeProvider = Provider.of<ThemeProvider>(context);

    // final bool isDarkTheme = themeProvider.isDarkTheme;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: pages[_currentIndex],
      floatingActionButton: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => BlocProvider(
              create: (context) => FlatViewModel(
                addFlatWithImageUseCase: AddFlatWithImageUseCase(
                  flatRepoContract: FlatRepoImpl(
                    flatDataSourceContract: FlatSupabaseDataSourceImpl(
                      flatSupabaseManager: FlatSupabaseManager.getInstance(),
                    ),
                  ),
                ),
              ),
              child: ApartmentDetailsBottomSheet(),
            ),
          );
        },
        child: CircleAvatar(
            backgroundColor: const Color.fromARGB(175, 0, 89, 79),
            radius: 30,
            child: Icon(Icons.add)),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: onItemTapped,
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              // onPressed: () {},
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

class LandLoardFlatsView extends StatelessWidget {
  const LandLoardFlatsView({
    super.key,
  });

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
      body: AllApartmentsListView(),
    );
  }
}
