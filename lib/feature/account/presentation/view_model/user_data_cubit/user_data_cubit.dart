import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/account/data/model/user_model.dart';
import 'package:graduation_project/feature/account/data/repos/user_repo.dart';
part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserRepo userRepo;
  UserDataCubit(this.userRepo) : super(UserDataInitial());

  Future<void> fetchUserData(String token) async {
    emit(UserDataLoading());
    final result = await userRepo.fetchUserData(token: token);
    result.fold(
      (failure) {
        emit(
          UserDataFailure(errMessage: failure.errMessage),
        );
      },
      (data) {
        emit(
          UserDataSuccess(userData: data),
        );
      },
    );
  }
}
