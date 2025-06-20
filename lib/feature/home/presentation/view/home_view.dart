import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/services/recomendation/cubit/ai_recomendation_cubit.dart';
import 'package:graduation_project/feature/flat/data/manager/flat_supabase_manager.dart';
import 'package:graduation_project/feature/flat/data/repository/data_source/flat_supabase_data_source_impl.dart';
import 'package:graduation_project/feature/flat/data/repository/repo/flat_repo_impl.dart';
import 'package:graduation_project/feature/flat/domain/use_case/add_flat_with_image_use_case.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/home_view_body.dart';

import '../../../flat/presentation/view_model/flat_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FlatViewModel(
            addFlatWithImageUseCase: AddFlatWithImageUseCase(
              flatRepoContract: FlatRepoImpl(
                flatDataSourceContract: FlatSupabaseDataSourceImpl(
                  flatSupabaseManager: FlatSupabaseManager.getInstance(),
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => AiRecomendationCubit(),
        ),
      ],
      child: const HomeViewBody(),
    );
  }
}
