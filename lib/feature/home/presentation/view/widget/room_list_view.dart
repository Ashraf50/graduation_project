import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widget/decoration_container.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/no_item_widget.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/post_item.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../../flat/presentation/view_model/flat_view_model.dart';

class RoomsListView extends StatefulWidget {
  const RoomsListView({super.key});

  @override
  State<RoomsListView> createState() => _RoomsListViewState();
}

class _RoomsListViewState extends State<RoomsListView> {
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
                  flatType: S.of(context).room,
                  flat: flats[index],
                );
              },
            ),
          );
  }
}
