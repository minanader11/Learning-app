import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mario_app/Domain/use_cases/verifyUseCase.dart';
import 'package:mario_app/presentation/authentication/verify_code/view_model/VerifyScreenStates.dart';

class VerifyScreenViewModel extends Cubit<VerifyScreenStates>{
  VerifyScreenViewModel({required this.verifyUseCase}): super(VerifyInitialState());

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  VerifyUseCase verifyUseCase;


  void verify(String email)async {
    bool validate=  formKey.currentState!.validate();
    if(validate){
     emit(VerifyLoadingState());
     var response = await verifyUseCase.invoke(email, pinController.text);
    }
  }

}