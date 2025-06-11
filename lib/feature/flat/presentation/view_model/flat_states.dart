abstract class FlatStates {}

class FlatInitialState extends FlatStates {}

class FlatLoadingState extends FlatStates {}

class FlatSuccessState extends FlatStates {
  String sucMsg;
  FlatSuccessState({
    required this.sucMsg,
  });
}

class FlatErrorState extends FlatStates {
  String errMsg;
  FlatErrorState({
    required this.errMsg,
  });
}
