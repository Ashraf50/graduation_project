import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/services/data/model/services_model.dart';
import 'package:graduation_project/feature/services/data/repo/services_repo.dart';
part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServiceRepo serviceRepo;

  ServicesCubit(this.serviceRepo) : super(ServicesInitial());

  Future<void> fetchServices(String type) async {
    emit(ServicesLoading());
    final Either<Failure, List<ServicesModel>> result;
    switch (type) {
      case 'bank':
        result = await serviceRepo.fetchAllBanks();
        break;
      case 'cafe':
        result = await serviceRepo.fetchAllCafes();
        break;
      case 'restaurant':
           
        result = await serviceRepo.fetchAllRestaurants();
        break;
      // case 'pharmacy':
      //   result = await serviceRepo.fetchAllPharmacies();
      //   break;
      case 'hospital':
        result = await serviceRepo.fetchAllHospitals();
        break;
      default:
        emit(ServicesFailure(errMessage: 'Invalid service type'));
        return;
    }

    result.fold(
      (failure) =>
          emit(ServicesFailure(errMessage: _mapFailureToMessage(failure))),
      (services) => emit(ServicesSuccess(services: services)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.errMessage;
    }
    return 'Unexpected error occurred.';
  }
}
