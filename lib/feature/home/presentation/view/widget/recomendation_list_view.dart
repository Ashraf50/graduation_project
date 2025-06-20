import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:graduation_project/core/services/recomendation/cubit/ai_recomendation_cubit.dart';
import 'package:graduation_project/core/widget/decoration_container.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/no_item_widget.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/post_item.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/function/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../../flat/presentation/view_model/flat_states.dart';
import '../../../../flat/presentation/view_model/flat_view_model.dart';
import 'recomended_flat_item.dart';

class RecomendationListView extends StatefulWidget {
  const RecomendationListView({super.key});

  @override
  State<RecomendationListView> createState() => _ApartmentListViewState();
}

class _ApartmentListViewState extends State<RecomendationListView> {
  // List<Flat> flats = [];

  @override
  void initState() {
    Future.sync(() {
      BlocProvider.of<FlatViewModel>(context).fetchAllFlats();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiRecomendationCubit, AiRecomendationState>(
      builder: (context, state) {
        if (state is AiRecomendationSuccess) {
          SmartDialog.dismiss();

          return DecorationContainer(
            widget: ListView.builder(
              itemCount: state.flats.length,
              itemBuilder: (context, index) {
                return RecomendedFlatItem(
                  // flatType: S.of(context).apartment,
                  flat: state.flats[index],
                );
              },
            ),
          );
        } else if (state is AiRecomendationLoading) {
          SmartDialog.showLoading(
              useAnimation: true, alignment: Alignment.center);
          return Container(
            color: AppColors.white,
            child: SizedBox(),
          );
        } else {
          SmartDialog.dismiss();
          return NoItemWidget(
            message: 'please view some flats to get Your recomendations',
          );
        }
      },
    );
    // return flats.isEmpty
    //     ? NoItemWidget()
    //     : DecorationContainer(
    //         widget: ListView.builder(
    //           itemCount: flats.length,
    //           itemBuilder: (context, index) {
    //             return PostItem(
    //               flatType: S.of(context).apartment,
    //               flat: flats[index],
    //             );
    //           },
    //         ),
    //       );
  }
}
