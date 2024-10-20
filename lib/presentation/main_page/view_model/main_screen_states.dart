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
class GetFavoriteLessonsInitialState extends MainScreenStates{}
class GetFavoriteLessonsLoadingState extends MainScreenStates{}

class GetFavoriteLessonsSuccessState extends MainScreenStates{}

class GetFavoriteLessonsFailureState extends MainScreenStates{
  String errMsg;
  GetFavoriteLessonsFailureState({required this.errMsg});
}
class GetBoughtLessonsInitialState extends MainScreenStates{}
class GetBoughtLessonsLoadingState extends MainScreenStates{}

class GetBoughtLessonsSuccessState extends MainScreenStates{}

class GetBoughtLessonsFailureState extends MainScreenStates{
  String errMsg;
  GetBoughtLessonsFailureState({required this.errMsg});
}
class ChangeTabInitialState extends MainScreenStates{}
class ChangeTabSuccessState extends MainScreenStates{}
class GetSingleLessonLoadingState extends MainScreenStates{}
class GetSingleLessonSuccessState extends MainScreenStates{}
class GetSingleLessonFailureState extends MainScreenStates{
  String errMsg;
  GetSingleLessonFailureState({required this.errMsg});
}
class PaymentLoadingState extends MainScreenStates{}
class PaymentSuccessState extends MainScreenStates{}
class PaymentFailureState extends MainScreenStates{
  String errMsg;
  PaymentFailureState({required this.errMsg});
}



