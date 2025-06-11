import '../../data/models/flat_model.dart';

abstract class FlatStates {}

class FlatInitialState extends FlatStates {}

class FlatLoadingState extends FlatStates {}

class AddingFlatSuccessState extends FlatStates {
  String sucMsg;
  AddingFlatSuccessState({
    required this.sucMsg,
  });
}

class AddingFlatErrorState extends FlatStates {
  String errMsg;
  AddingFlatErrorState({
    required this.errMsg,
  });
}

class FetchingAllFlatsSuccessState extends FlatStates {
  List<Flat> flats;
  FetchingAllFlatsSuccessState({
    required this.flats,
  });
}

class FetchingAllFlatsErrorState extends FlatStates {
  String errMsg;
  FetchingAllFlatsErrorState({
    required this.errMsg,
  });
}

class FetchingAllFlatsLoadingState extends FlatStates {}

class FetchingLandlordFlatsSuccessState extends FlatStates {
  List<Flat> flats;
  FetchingLandlordFlatsSuccessState({
    required this.flats,
  });
}

class FetchingLandlordFlatsErrorState extends FlatStates {
  String errMsg;
  FetchingLandlordFlatsErrorState({
    required this.errMsg,
  });
}

class FetchingLandlordFlatsLoadingState extends FlatStates {}
