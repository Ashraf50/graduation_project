import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/widget/account_photo.dart';
import 'package:graduation_project/feature/desktop/widget/icon_button.dart';
import 'package:graduation_project/feature/desktop/widget/left_part.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_style.dart';
import '../home/presentation/view/widget/all_posts_list_view.dart';
import '../home/presentation/view/widget/apartment_list_view.dart';
import '../home/presentation/view/widget/room_list_view.dart';
import 'widget/custom_message_overly.dart';
import 'widget/tab_widget.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  bool isOverlayVisible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: AccountPhoto(),
          ),
          actions: [
            CustomIconButton(
              icon: 'assets/img/search.svg',
              onTap: () {},
            ),
            CustomIconButton(
              icon: 'assets/img/messenger.svg',
              onTap: () {
                setState(() {
                  isOverlayVisible = !isOverlayVisible;
                });
              },
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .3),
              child: TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.zero,
                labelColor: Colors.white,
                labelStyle: AppStyles.textStyle20notBold,
                indicatorColor: AppColors.white,
                unselectedLabelStyle: AppStyles.textStyle18White,
                dividerHeight: 0,
                tabs: [
                  TabWidget(
                    selectedIndex: _selectedIndex,
                    index: 0,
                    activeIcon: 'assets/img/active_home.svg',
                    icon: 'assets/img/home.svg',
                  ),
                  TabWidget(
                    selectedIndex: _selectedIndex,
                    index: 1,
                    activeIcon: 'assets/img/active_category.svg',
                    icon: 'assets/img/category.svg',
                  ),
                  TabWidget(
                    selectedIndex: _selectedIndex,
                    index: 2,
                    activeIcon: 'assets/img/active_favorite.svg',
                    icon: 'assets/img/favorite.svg',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: LeftPartViewBody(),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 4,
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      AllPostsListView(),
                      ApartmentListView(),
                      RoomsListView(),
                    ],
                  ),
                ),
                screenWidth > 1100
                    ? Expanded(
                        flex: 2,
                        child: LeftPartViewBody(),
                      )
                    : SizedBox(),
              ],
            ),
            if (isOverlayVisible)
              CustomMessageOverlay(
                onClose: () {
                  setState(() {
                    isOverlayVisible = false;
                  });
                },
              ),
          ],
        ),
        floatingActionButton: InkWell(
          onTap: () {
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
