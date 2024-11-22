part of 'suggestion_places_cubit.dart';

sealed class SuggestionPlacesState {}

final class SuggestionPlacesInitial extends SuggestionPlacesState {}

final class SuggestionPlacesLoading extends SuggestionPlacesState {}

final class SuggestionPlacesSuccess extends SuggestionPlacesState {
  final List<Map> suggestions;
  SuggestionPlacesSuccess({required this.suggestions});
}

final class SuggestionPlacesFailure extends SuggestionPlacesState {
  final String errMessage;
  SuggestionPlacesFailure({required this.errMessage});
}
