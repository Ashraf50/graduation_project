part of 'ai_recomendation_cubit.dart';

sealed class AiRecomendationState {}

final class AiRecomendationInitial extends AiRecomendationState {}

final class AiRecomendationLoading extends AiRecomendationState {}

final class AiRecomendationSuccess extends AiRecomendationState {
  final List<Flat> flats;

  AiRecomendationSuccess({required this.flats});
}

final class AiRecomendationFailure extends AiRecomendationState {
  final String errMessage;

  AiRecomendationFailure({required this.errMessage});
}
