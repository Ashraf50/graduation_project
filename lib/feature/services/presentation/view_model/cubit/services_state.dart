part of 'services_cubit.dart';

sealed class ServicesState {}

final class ServicesInitial extends ServicesState {}

final class ServicesLoading extends ServicesState {}

final class ServicesSuccess extends ServicesState {
  final List<ServicesModel> services;
  ServicesSuccess({required this.services});
}

final class ServicesFailure extends ServicesState {
  final String errMessage;
  ServicesFailure({required this.errMessage});
}
