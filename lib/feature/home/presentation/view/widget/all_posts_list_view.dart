import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/widget/decoration_container.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_view_model.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/no_item_widget.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/post_item.dart';
import 'package:graduation_project/generated/l10n.dart';

class AllPostsListView extends StatefulWidget {
  const AllPostsListView({super.key});

  @override
  State<AllPostsListView> createState() => _AllPostsListViewState();
}

class _AllPostsListViewState extends State<AllPostsListView> {
  List<Flat> flats = [];

  @override
  void initState() {
    Future.sync(() {
      BlocProvider.of<FlatViewModel>(context).fetchAllFlats();
    }).then((flats) {
      setState(() {
        flats = flats;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return flats.isEmpty
        ? NoItemWidget()
        : DecorationContainer(
            widget: ListView.builder(
              itemCount: flats.length,
              itemBuilder: (context, index) {
                return PostItem(
                  flatType: int.tryParse(flats[index].numRooms!)! <= 1
                      ? S.of(context).room
                      : S.of(context).apartment,
                  flat: flats[index],
                );
              },
            ),
          );
  }
}

