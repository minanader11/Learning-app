import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mario_app/Domain/entities/centersResponseEntity.dart';
import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';
import 'package:mario_app/Domain/use_cases/getCentersUseCase.dart';
import 'package:mario_app/Domain/use_cases/getGradesUseCase.dart';
import 'package:mario_app/Domain/use_cases/registerUseCase.dart';
import 'package:mario_app/presentation/authentication/register/view_model/register_states.dart';

class RegisterViewModel extends Cubit<RegisterStates>{
  RegisterViewModel({required this.getGradesUseCase,required this.getCentersUseCase,required this.registerUseCase }):super(RegisterInitialState());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController parentPhoneController = TextEditingController();
  List<GradeEntity> grades=[];
   GradeEntity selectedGrade=GradeEntity();
  List<CenterEntity> centers=[];
  CenterEntity selectedCenter=CenterEntity();
  GetGradesUseCase getGradesUseCase;
  GetCentersUseCase getCentersUseCase;
  RegisterUseCase registerUseCase;
  String userEmail='';
  final formKey = GlobalKey<FormState>();
  void register()async {
    bool validate=  formKey.currentState!.validate();

    if(validate){
      userEmail = emailController.text;
      emit(RegisterLoadingState());
      var either= await registerUseCase.invoke(fullNameController.text.toString(), emailController.text.toString(), passwordController.text.toString(), mobileNumberController.text.toString(), parentPhoneController.text.toString(), selectedGrade.id!.toString(), selectedCenter.id!.toString());

      either.fold((l) {
        emit(RegisterErrorState(errorMsg: l.errMsg));
      }, (r) {
        print('success');
        emit(RegisterSuccessState());
      });
    }
  }
  void getGrades()async{
    emit(GradesLoadingState());
    var either= await getGradesUseCase.invoke();
    either.fold((l) {
      emit(GradesFailureState(errorMsg: l.errMsg));
    }, (r) {
      grades= r.grades!;
      selectedGrade=grades[0];
  print(grades.length.toString());
      emit(GradesSuccessState());
    });

  }
  void getCenters()async{
    emit(GradesLoadingState());
    var either= await getCentersUseCase.invoke();
    either.fold((l) {
      emit(GradesFailureState(errorMsg: l.errMsg));
    }, (r) {
      centers= r.centers!;
      selectedCenter=centers[0];

      emit(CentersSuccessState());
    });

  }
  changeGradeItem(GradeEntity newBrand){
    emit(GradeItemInitialStates());
    selectedGrade= newBrand;
    emit(DropDownGradeChangeItemState());
  }
  changeCenterItem(CenterEntity newBrand){
    emit(CenterItemInitialStates());
    selectedCenter= newBrand;
    emit(DropDownCenterChangeItemState());
  }
  changeUserEmail(String newEmail){
    emit(UserEmailInitialState());
    userEmail = newEmail;
    emit(UserEmailChangeState());
  }

}