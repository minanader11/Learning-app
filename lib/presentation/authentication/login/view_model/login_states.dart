

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{

  LoginSuccessState();
}
class LoginErrorState extends LoginStates{
  String errorMsg;
  LoginErrorState({required this.errorMsg});
}
class PushNotificationSetupInitialState extends LoginStates{}
class PushNotificationSetupSuccessState extends LoginStates{}

