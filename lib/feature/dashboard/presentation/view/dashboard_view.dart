import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/dashboard_view_body.dart';
import 'package:graduation_project/feature/flat/data/manager/flat_supabase_manager.dart';
import 'package:graduation_project/feature/flat/data/repository/data_source/flat_supabase_data_source_impl.dart';
import 'package:graduation_project/feature/flat/data/repository/repo/flat_repo_impl.dart';
import 'package:graduation_project/feature/flat/domain/use_case/add_flat_with_image_use_case.dart';

import '../../../flat/presentation/view_model/flat_view_model.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlatViewModel(
        addFlatWithImageUseCase: AddFlatWithImageUseCase(
          flatRepoContract: FlatRepoImpl(
            flatDataSourceContract: FlatSupabaseDataSourceImpl(
              flatSupabaseManager: FlatSupabaseManager.getInstance(),
            ),
          ),
        ),
      ),
      child: const DashboardViewBody(),
    );
  }
}
