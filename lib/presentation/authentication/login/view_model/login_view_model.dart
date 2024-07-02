

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/use_cases/loginUseCase.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_states.dart';

class LoginViewModel extends Cubit<LoginStates>{

  TextEditingController emailController = TextEditingController(text: 'mina@gmail.com');
  TextEditingController passwordController = TextEditingController(text: '123456');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginViewModel({required this.loginUseCase}): super(LoginInitialState());
  LoginUseCase loginUseCase;
  UserResponseEntity user=UserResponseEntity();
  String token='';
  String? deviceKey='';
  void login()async {
    bool validate=  formKey.currentState!.validate();
    if(validate){
      emit(LoginLoadingState());
     var response= await loginUseCase.invoke(emailController.text.toString(), passwordController.text.toString(),deviceKey!);
     response.fold((l) {
       emit(LoginErrorState(errorMsg: l.errMsg));
     }, (r) {
       user = r.user!;
       token = r.token!;
       emit(LoginSuccessState());
     });
    }
  }
  void setupPushNotification()async {
    emit(PushNotificationSetupInitialState());
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();

    deviceKey= await fcm.getToken();

    print('DeviceKEy:$deviceKey');
    emit(PushNotificationSetupSuccessState());
  }

}