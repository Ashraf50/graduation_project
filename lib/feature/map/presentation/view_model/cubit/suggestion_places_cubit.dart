import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/app_strings.dart';
import '../../../data/utils/location_service.dart';
part 'suggestion_places_state.dart';

class SuggestionPlacesCubit extends Cubit<SuggestionPlacesState> {
  final Dio _dio = Dio();
  final LocationService locationService = LocationService();

  SuggestionPlacesCubit() : super(SuggestionPlacesInitial());
  Future<void> fetchSuggestions(String query) async {
    emit(SuggestionPlacesLoading());
    try {
      final currentPosition = await locationService.getLocation();
      final lat = currentPosition.latitude;
      final long = currentPosition.longitude;
      final response = await _dio.get(
        'https://discover.search.hereapi.com/v1/discover',
        queryParameters: {
          'q': query,
          'at': '$lat,$long',
          'apiKey': AppStrings.apiKey,
        },
      );
      final suggestionsData = response.data['items'];
      if (suggestionsData != null && suggestionsData.isNotEmpty) {
        final suggestions = suggestionsData.map<Map<String, dynamic>>((item) {
          final title = item['title'];
          final address =
              item['address'] != null ? item['address']['label'] : '';
          final position = item['position'] ?? {};
          return {
            'title': title,
            'address': address,
            'latitude': position['lat'],
            'longitude': position['lng'],
          };
        }).toList();
        emit(SuggestionPlacesSuccess(suggestions: suggestions));
      } else {
        emit(SuggestionPlacesFailure(errMessage: 'No suggestions found.'));
      }
    } catch (e) {
      emit(SuggestionPlacesFailure(
          errMessage: 'Error fetching suggestions: $e'));
    }
  }
}
