
abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{

  RegisterSuccessState();
}
class RegisterErrorState extends RegisterStates{
  String errorMsg;
  RegisterErrorState({required this.errorMsg});
}
class GradesInitialState extends RegisterStates{}
class GradesLoadingState extends RegisterStates{}
class GradesSuccessState extends RegisterStates{}
class GradesFailureState extends RegisterStates{
  String errorMsg;
  GradesFailureState({required this.errorMsg});
}
class CentersInitialState extends RegisterStates{}
class  CentersLoadingState extends RegisterStates{}
class CentersSuccessState extends RegisterStates{}
class  CentersFailureState extends RegisterStates{
  String errorMsg;
  CentersFailureState({required this.errorMsg});
}
class GradeItemInitialStates extends RegisterStates{}
class DropDownGradeChangeItemState extends RegisterStates{}
class CenterItemInitialStates extends RegisterStates{}
class DropDownCenterChangeItemState extends RegisterStates{}
class UserEmailInitialState extends RegisterStates{}
class UserEmailChangeState extends RegisterStates{}