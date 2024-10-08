

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
class LoginGmailInitialState extends LoginStates{}
class LoginGmailLoadingState extends LoginStates{}
class LoginGmailSuccessState extends LoginStates{

  LoginGmailSuccessState();
}
class LoginGmailErrorState extends LoginStates{
  String errorMsg;
  LoginGmailErrorState({required this.errorMsg});
}
