import 'package:get_it/get_it.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_view_model.dart';

import '../../../feature/flat/data/manager/flat_supabase_manager.dart';
import '../../../feature/flat/data/repository/data_source/flat_supabase_data_source_impl.dart';
import '../../../feature/flat/data/repository/repo/flat_repo_impl.dart';
import '../../../feature/flat/domain/use_case/add_flat_with_image_use_case.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<FlatViewModel>(
    FlatViewModel(
      addFlatWithImageUseCase: AddFlatWithImageUseCase(
        flatRepoContract: FlatRepoImpl(
          flatDataSourceContract: FlatSupabaseDataSourceImpl(
            flatSupabaseManager: FlatSupabaseManager.getInstance(),
          ),
        ),
      ),
    ),
  );

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}
