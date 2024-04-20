import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_view_model.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';
import 'package:mario_app/presentation/profile/view/widgets/customInfoItem.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {

    var loginBloc = BlocProvider.of<LoginViewModel>(context);
    MainScreenViewModel mainScreenViewModel=BlocProvider.of<MainScreenViewModel>(context)..getProfile(loginBloc.token);
    return BlocBuilder<MainScreenViewModel, MainScreenStates>(
        builder: (context, state) {
          if (state is GetProfileILoadingState) {
            return Center(child: CircularProgressIndicator(),);
          }
          else if (state is GetProfileSuccessState) {
            return Container(
              margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
              child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        MyTexts.chemistryAcademy,
                        style: Styles.textStyle24.copyWith(
                            color: MyColors.primaryColor,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 24.h,),
                      Text('Welcome,${mainScreenViewModel.user.name}',
                        style: Styles.textStyle18.copyWith(
                            color: MyColors.primaryColor),),
                      SizedBox(height: 40.h,),
                      CustomInfoItem(text: MyTexts.yourEmail,
                          info: mainScreenViewModel.user.email ?? ''),
                      SizedBox(height: 24.h,),
                      CustomInfoItem(text: MyTexts.yourUserName,
                          info: mainScreenViewModel.user.name ?? ''),
                      SizedBox(height: 24.h,),
                      CustomInfoItem(text: MyTexts.yourPhone,
                          info: mainScreenViewModel.user.phone ?? ''),
                      SizedBox(height: 24.h,),
                      CustomInfoItem(text: MyTexts.yourCenter,
                          info: mainScreenViewModel.user.center?.name ?? '',
                          textDirection: TextDirection.rtl),
                      SizedBox(height: 24.h,),
                      CustomInfoItem(text: MyTexts.yourGrade,
                          info: mainScreenViewModel.user.grade?.name ?? '',
                          textDirection: TextDirection.rtl),
                      SizedBox(height: 24.h,),
                      CustomInfoItem(text: MyTexts.yourBalanceAccount,
                          info: '${mainScreenViewModel.user.balance} EGP'),
                      SizedBox(height: 24.h,),
                    ],
                  )

              ),);
          }else{
            return Container();
          }
          }
    );
  }
}
