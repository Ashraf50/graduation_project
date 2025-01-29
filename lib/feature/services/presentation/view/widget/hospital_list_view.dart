import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/services/data/repo/services_repo_impl.dart';
import 'package:graduation_project/feature/services/presentation/view/widget/service_card.dart';
import 'package:graduation_project/feature/services/presentation/view_model/cubit/services_cubit.dart';
import '../../../../../core/widget/decoration_container.dart';

class HospitalsListView extends StatelessWidget {
  const HospitalsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecorationContainer(
      widget: BlocProvider(
        create: (context) =>
            ServicesCubit(ServicesRepoImpl())..fetchServices('hospital'),
        child: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            if (state is ServicesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ServicesFailure) {
              return Center(
                child: Text(state.errMessage),
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

