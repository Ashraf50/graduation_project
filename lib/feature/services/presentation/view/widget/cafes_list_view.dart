import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widget/decoration_container.dart';
import 'package:graduation_project/feature/services/presentation/view/widget/service_card.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../data/repo/services_repo_impl.dart';
import '../../view_model/cubit/services_cubit.dart';

class CafesListView extends StatelessWidget {
  const CafesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecorationContainer(
      widget: BlocProvider(
        create: (context) =>
            ServicesCubit(ServicesRepoImpl())..fetchServices('cafe'),
        child: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            if (state is ServicesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ServicesFailure) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else if (state is ServicesSuccess) {
              return ListView.builder(
                // shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.services.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ServiceCard(
                      service: state.services[index],
                    ),
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
