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
class GetLessonsInitialState extends MainScreenStates{}
class GetLessonsILoadingState extends MainScreenStates{}

class GetLessonsSuccessState extends MainScreenStates{}

class GetLessonsErrorState extends MainScreenStates{
  String errMsg;
  GetLessonsErrorState({required this.errMsg});
}
class BuyLessonInitialState extends MainScreenStates{}
class BuyLessonRequestState extends MainScreenStates{}
class BuyLessonSuccessState extends MainScreenStates{}
class BuyLessonLoadingState extends MainScreenStates{}
class BuyLessonErrorState extends MainScreenStates{}
class ChangeLessonIdInitalState extends MainScreenStates{}
class ChangeLessonIdSuccessState extends MainScreenStates{}




