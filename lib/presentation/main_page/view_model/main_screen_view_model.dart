


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mario_app/Domain/entities/LessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/use_cases/buyLessonUseCase.dart';
import 'package:mario_app/Domain/use_cases/getLessonsUseCase.dart';
import 'package:mario_app/Domain/use_cases/getProfileUseCase.dart';
import 'package:mario_app/Domain/use_cases/redeemCodeUseCase.dart';
import 'package:mario_app/presentation/add_card/view/add_card_screen.dart';
import 'package:mario_app/presentation/home/view/home_tab.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/profile/view/profile_tab.dart';

class MainScreenViewModel extends Cubit<MainScreenStates>{
  MainScreenViewModel({required this.redeemCodeUseCase,required this.getProfileUseCase,required this.getLessonsUseCase,required this.buyLessonUseCase}):super(MainScreenInitialState());
  List<Widget> tabs =  [
  AddCardScreen(),
    ProfileTab(),
    HomeTab(),
    HomeTab(),
    ProfileTab(),

  ];
 int selectedIndex=0;
  final formKey = GlobalKey<FormState>();
  TextEditingController codeController=TextEditingController();
 RedeemCodeUseCase redeemCodeUseCase;
 GetProfileUseCase getProfileUseCase;
  UserResponseEntity user=UserResponseEntity();
  GetLessonsUseCase getLessonsUseCase;
  BuyLessonUseCase buyLessonUseCase;
  List<LessonEntity> lessons=[];
  num lessonId=0;
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
 getLessons(String token)async{
   emit(GetLessonsILoadingState());
   var response= await getLessonsUseCase.invoke(token);
   response.fold((l) {
     print('get lessons error');
     emit(GetLessonsErrorState(errMsg: l.errMsg));
   }, (r) {
     print('success');
     lessons=r.lessons!;
     emit(GetLessonsSuccessState());
   });
 }
 buyLesson(String token,String lessonId)async{
   //emit(BuyLessonRequestState());
   emit(BuyLessonLoadingState());
   var response = await buyLessonUseCase.invoke(token, lessonId);
   response.fold((l) {
     emit(BuyLessonErrorState());
   }, (r) {
     emit(BuyLessonSuccessState());
   });
 }
 requestBuyLesson(){

   emit(BuyLessonRequestState());
 }
 changeLessonID(num newLessonId){
   emit(ChangeLessonIdInitalState());
   lessonId=newLessonId;
   emit(ChangeLessonIdSuccessState());

 }

}