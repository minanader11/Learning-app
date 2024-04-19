abstract class VerifyScreenStates{}
class VerifyInitialState extends VerifyScreenStates{}
class VerifyLoadingState extends VerifyScreenStates{}
class VerifySuccessState extends VerifyScreenStates{

  VerifySuccessState();
}
class VerifyErrorState extends VerifyScreenStates{
  String errorMsg;
  VerifyErrorState({required this.errorMsg});
}