abstract class MainScreenStates{}
class MainScreenInitialState extends MainScreenStates{}
class ChangeNavigationBarState extends MainScreenStates{}
class RedeemCodeInitialState extends MainScreenStates{}
class RedeemCodeLoadingState extends MainScreenStates{}
class RedeemCodeSuccessState extends MainScreenStates{}
class RedeemCodeErrorState extends MainScreenStates{
  String errMsg;
  RedeemCodeErrorState({required this.errMsg});
}
class GetProfileInitialState extends MainScreenStates{}
class GetProfileILoadingState extends MainScreenStates{}

class GetProfileSuccessState extends MainScreenStates{}

class GetProfileErrorState extends MainScreenStates{
  String errMsg;
  GetProfileErrorState({required this.errMsg});
}


