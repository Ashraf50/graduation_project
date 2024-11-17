import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'suggestion_places_state.dart';

class SuggestionPlacesCubit extends Cubit<SuggestionPlacesState> {
  final Dio _dio = Dio();
  SuggestionPlacesCubit() : super(SuggestionPlacesInitial());
  Future<void> fetchSuggestions(String query) async {
    emit(SuggestionPlacesLoading());
    try {
      final lat = 30.666814283311574;
      final lon = 30.069335102342595;
      final response = await _dio.get(
        'https://discover.search.hereapi.com/v1/discover',
        queryParameters: {
          'q': query,
          'at': '$lat,$lon',
          'apiKey': 'uUWF7IG2I4MBkruijI6cLgcAT1g-gxJ5kkIk6d8Fby4',
        },
      );

      final suggestionsData = response.data['items'];
      print(suggestionsData);
      if (suggestionsData != null && suggestionsData.isNotEmpty) {
        final suggestions = suggestionsData.map<String>((item) {
          final title = item['title'] as String;
          final address =
              item['address'] != null ? item['address']['label'] : '';
          return '$title\n$address';
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
