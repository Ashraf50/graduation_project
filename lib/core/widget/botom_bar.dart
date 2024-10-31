// import 'package:flutter/material.dart';


// class BottomBar extends StatefulWidget {
//   const BottomBar({super.key});

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int currentIndex = 0;
//   changeItem(int value) {
//     setState(() {
//       currentIndex = value;
//     });
//   }

//   List pages = [
//     const HomeView(),
//     const FavoriteView(),
//     const CartView(),
//     const ProfileView(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages.elementAt(currentIndex),
//       bottomNavigationBar: SalomonBottomBar(
//         currentIndex: currentIndex,
//         onTap: changeItem,
//         items: [
//           SalomonBottomBarItem(
//             icon: SvgPicture.asset("assets/img/home.svg", height: 25),
//             title: Text(S.of(context).home),
//             selectedColor: AppColors.buttonColor,
//           ),
//           SalomonBottomBarItem(
//             icon: SvgPicture.asset("assets/img/favorite.svg", height: 25),
//             title: Text(S.of(context).Favorite),
//             selectedColor: AppColors.buttonColor,
//           ),
//           SalomonBottomBarItem(
//             icon: SvgPicture.asset("assets/img/cart.svg", height: 25),
//             title: Text(S.of(context).cart),
//             selectedColor: AppColors.buttonColor,
//           ),
//           SalomonBottomBarItem(
//             icon: SvgPicture.asset("assets/img/profile.svg", height: 25),
//             title: Text(S.of(context).profile),
//             selectedColor: AppColors.buttonColor,
//           ),
//         ],
//       ),
//     );
//   }
// }
