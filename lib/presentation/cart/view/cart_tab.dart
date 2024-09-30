import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_view_model.dart';
import 'package:mario_app/presentation/home/view/widgets/lesson_list.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';
import 'package:mario_app/presentation/utils/dialog_utils.dart';
import 'package:mario_app/presentation/utils/shimmer.dart';

class CartTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var loginBloc = BlocProvider.of<LoginViewModel>(context);
    MainScreenViewModel mainScreenViewModel =
    BlocProvider.of<MainScreenViewModel>(context)..getBoughtLessons(loginBloc.token);
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(MyTexts.chemistryAcademy,
              style: Styles.textStyle24.copyWith(
                  color: MyColors.primaryColor, fontStyle: FontStyle.italic)),
          SizedBox(
            height: 10.h,
          ),
          Text(MyTexts.lessons,
              style: Styles.textStyle20.copyWith(color: MyColors.primaryColor)),
          SizedBox(
            height: 10.h,
          ),
          BlocConsumer<MainScreenViewModel, MainScreenStates>(listener: (context, state) {
            if(state is BuyLessonRequestState){
              DialogUtils.showMessage(
                  context: context,
                  message: "You Don't have this lesson do you want to buy it ",
                  actionName: 'ok',
                  posActionFun: () {
                    mainScreenViewModel.buyLesson(loginBloc.token, mainScreenViewModel.lessonId.toString());
                    // mainScreenViewModel.getLessons(loginBloc.token);
                  });
            } else if(state is BuyLessonSuccessState ){
              DialogUtils.hideLoading(context);

              DialogUtils.showMessage(
                  context: context,
                  message: "You bought Lesson  ",
                  actionName: 'ok',
                  posActionFun: () {
                    Navigator.of(context).pop();
                    mainScreenViewModel.getBoughtLessons(loginBloc.token);
                  });

            } else if(state is BuyLessonErrorState){
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                  context: context,
                  message: "You Don't have enough balance ",
                  actionName: 'ok',
                  posActionFun: () {
                    Navigator.of(context).pop();
                  });
            } else if (state is BuyLessonLoadingState){
              DialogUtils.hideLoading(context);
              DialogUtils.showLoading(context: context);
            }
          },
            builder: (context, state) {
              if (state is GetBoughtLessonsLoadingState) {
                // return Expanded(
                //   child: Container(
                //     child: Center(
                //       child: CircularProgressIndicator(),
                //     ),
                //   ),
                // );
                return Expanded(child:ListView.builder(itemCount: 1,itemBuilder:(context, index) =>  ShimmerLoading(width: 360.w,height: 310.h,)));
              } else if (state is GetBoughtLessonsFailureState) {
                return Center(
                  child: Text(
                    state.errMsg,
                    style:
                    Styles.textStyle24.copyWith(color: MyColors.blackColor),
                  ),
                );
              } else {
                return LessonList(
                  lessons: mainScreenViewModel.boughtLessons,
                );
              }
            },
          ),
          SizedBox(height: 50.h,)
        ],
      ),
    );

  }
}