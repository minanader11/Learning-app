import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/use_cases/getProfileUseCase.dart';
import 'package:mario_app/Domain/use_cases/redeemCodeUseCase.dart';
import 'package:mario_app/presentation/home/view/home_tab.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/profile/view/profile_tab.dart';

class MainScreenViewModel extends Cubit<MainScreenStates>{
  MainScreenViewModel({required this.redeemCodeUseCase,required this.getProfileUseCase}):super(MainScreenInitialState());
  List<Widget> tabs = const [
   HomeTab(),
    ProfileTab()
  ];
 int selectedIndex=1;
  final formKey = GlobalKey<FormState>();
  TextEditingController codeController=TextEditingController();
 RedeemCodeUseCase redeemCodeUseCase;
 GetProfileUseCase getProfileUseCase;
  UserResponseEntity user=UserResponseEntity();
  String? token='';
 changeIndex(int newIndex){
   emit(MainScreenInitialState());
   selectedIndex=newIndex;
   emit(ChangeNavigationBarState());
 }
 redeemCode(String token)async{
   bool validate=  formKey.currentState!.validate();

   if(validate){
     emit(RedeemCodeLoadingState());
     var response= await redeemCodeUseCase.invoke(codeController.text, token);
     response.fold((l) {
       emit(RedeemCodeErrorState(errMsg: l.errMsg));
     }, (r) {
       emit(RedeemCodeSuccessState());
     });
   }
 }
 getProfile(String token)async{
   emit(GetProfileILoadingState());
   var response=await getProfileUseCase.invoke(token);
   response.fold((l) {
     emit(GetProfileErrorState(errMsg: l.errMsg));
   }, (r) {
     user = r.user!;
     emit(GetProfileSuccessState());
   });

 }
  void setupPushNotification()async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();

    token= await fcm.getToken();
    print(token);
  }

}