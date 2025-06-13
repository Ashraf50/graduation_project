import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/widget/decoration_container.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_view_model.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/no_item_widget.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/post_item.dart';
import 'package:graduation_project/generated/l10n.dart';

import '../../../../flat/presentation/view_model/flat_states.dart';

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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlatViewModel, FlatStates>(
      builder: (context, state) {
        if (state is FetchingAllFlatsSuccessState) {
          SmartDialog.dismiss();
          return DecorationContainer(
            widget: ListView.builder(
              itemCount: state.flats.length,
              itemBuilder: (context, index) {
                return PostItem(
                  flatType: int.tryParse(state.flats[index].numRooms!)! <= 1
                      ? S.of(context).room
                      : S.of(context).apartment,
                  flat: state.flats[index],
                );
              },
            ),
          );
        } else if (state is FetchingAllFlatsLoadingState) {
          SmartDialog.showLoading(
              useAnimation: true, alignment: Alignment.center);
          return Container(
            color: AppColors.white,
            child: SizedBox(),
          );
        } else {
          SmartDialog.dismiss();

          return NoItemWidget();
        }
      },
    );
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
