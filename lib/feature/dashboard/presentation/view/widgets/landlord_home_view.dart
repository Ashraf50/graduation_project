import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_states.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_view_model.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/no_item_widget.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_style.dart';
import '../../../../../core/constant/function/get_current_user.dart';
import 'all_apartments_list_view.dart';

class LandLoardHomeView extends StatefulWidget {
  const LandLoardHomeView({
    super.key,
  });

  @override
  State<LandLoardHomeView> createState() => _LandLoardHomeViewState();
}

class _LandLoardHomeViewState extends State<LandLoardHomeView> {
  late FlatViewModel flatCubit;
  
  @override
  void initState() {
    flatCubit = BlocProvider.of<FlatViewModel>(context);
    
      flatCubit.fetchFlatsByLandlordId(getCurrentUser().id);
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(
              'Your Flats',
              style: AppStyles.textStyle18White,
            ),
            centerTitle: true,
            scrolledUnderElevation: 0,
            iconTheme: IconThemeData(color: AppColors.white),
            pinned: true,
            floating: true,
          ),
        ];
      },
      body: BlocBuilder<FlatViewModel, FlatStates>(
        builder: (context, state) {
          if (state is FetchingLandlordFlatsSuccessState) {
            {
              SmartDialog.dismiss();
              return AllApartmentsListView(
                flats: state.flats,
              );
            }
          } else if (state is FetchingLandlordFlatsLoadingState) {
            SmartDialog.showLoading(
              useAnimation: true,
              alignment: Alignment.center,
            );
            return Container(color: AppColors.white, child: SizedBox());
          } else {
            return NoItemWidget();
          }
        },
      ),
    );
  }
}
