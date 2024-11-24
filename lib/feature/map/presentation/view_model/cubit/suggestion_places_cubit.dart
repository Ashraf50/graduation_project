import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/map/data/model/places_model/places_model.dart';
import 'package:graduation_project/feature/map/data/repo/map_repo.dart';
import 'package:graduation_project/core/helper/location_service.dart';
part 'suggestion_places_state.dart';

class SuggestionPlacesCubit extends Cubit<SuggestionPlacesState> {
  final MapRepo mapRepo;
  LocationService locationService = LocationService();
  SuggestionPlacesCubit(this.mapRepo) : super(SuggestionPlacesInitial());

  Future<void> fetchAllSuggestionPlaces({required String query}) async {
    emit(SuggestionPlacesLoading());
    var result = await mapRepo.fetchAllPlaces(query: query);
    result.fold(
      (failure) {
        emit(
          SuggestionPlacesFailure(errMessage: failure.errMessage),
        );
      },
      (places) {
        emit(
          SuggestionPlacesSuccess(suggestionPlaces: places),
        );
      },
    );
  }
  void clearSuggestionPlaces() {
    emit(SuggestionPlacesSuccess(suggestionPlaces: []));
  }
}
