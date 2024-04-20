

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mario_app/Domain/use_cases/loginUseCase.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_states.dart';

class LoginViewModel extends Cubit<LoginStates>{

  TextEditingController emailController = TextEditingController(text: 'golda44@example.com');
  TextEditingController passwordController = TextEditingController(text: '123456');
  final formKey = GlobalKey<FormState>();

  LoginViewModel({required this.loginUseCase}): super(LoginInitialState());
  LoginUseCase loginUseCase;

  void login()async {
    bool validate=  formKey.currentState!.validate();
    if(validate){
      emit(LoginLoadingState());
     var response= await loginUseCase.invoke(emailController.text.toString(), passwordController.text.toString());
     response.fold((l) {
       emit(LoginErrorState(errorMsg: l.errMsg));
     }, (r) {
       emit(LoginSuccessState());
     });
    }
  }

}