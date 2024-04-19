

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_states.dart';

class LoginViewModel extends Cubit<LoginStates>{

  TextEditingController emailController = TextEditingController(text: 'ahmedmutti@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'Ahmed@123');
  final formKey = GlobalKey<FormState>();

  LoginViewModel(): super(LoginInitialState());

  void login()async {
    bool validate=  formKey.currentState!.validate();
    if(validate){

    }
  }

}