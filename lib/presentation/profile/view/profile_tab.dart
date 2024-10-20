import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mario_app/core/imagePaths.dart';
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
    MainScreenViewModel mainScreenViewModel =
    BlocProvider.of<MainScreenViewModel>(context)
      ..getProfile(loginBloc.token);
    return BlocBuilder<MainScreenViewModel, MainScreenStates>(
        builder: (context, state) {
          if (state is GetProfileILoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetProfileSuccessState) {
            return Container(
              margin: EdgeInsets.only(left: 22.w, right: 22.w, top: 57.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        MyTexts.personalInfo,
                        style: Styles.textStyle20,
                      ),
                      Text(
                        MyTexts.edit,
                        style: Styles.textStyle20.copyWith(
                            decoration: TextDecoration.underline,
                            color: MyColors.purpleColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      // SvgPicture.asset(
                      //   ImagePaths.profileAvatar,
                      //   height: 105.h,
                      //   width: 105.w,
                      // ),
                      Container(width: 105.w,
                        height: 105.h,
                        decoration: BoxDecoration(shape: BoxShape.circle,color: MyColors.greyColor),
                        child: Icon(Icons.person,color: MyColors.purpleColor,size: 60.h,),),
                      SizedBox(
                        width: 29.w,
                      ),
                      Text(
                        mainScreenViewModel.user.name ?? '',
                        style: Styles.textStyle20,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Container(margin: EdgeInsets.only(bottom: 35.h),padding: EdgeInsets.only(left: 20.w, top: 20.h,bottom: 10.h),
                      decoration:
                      BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          CustomInfoItem(
                              icon: Icons.email,
                              text: MyTexts.yourEmail,
                              info: mainScreenViewModel.user.email ?? ''),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomInfoItem(
                              icon: Icons.person,
                              text: MyTexts.yourUserName,
                              info: mainScreenViewModel.user.name ?? ''),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomInfoItem(
                              icon: Icons.call,
                              text: MyTexts.yourPhone,
                              info: mainScreenViewModel.user.phone ?? ''),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomInfoItem(
                              icon: Icons.place,
                              text: MyTexts.yourCenter,
                              info: mainScreenViewModel.user.center?.name ?? '',
                              textDirection: TextDirection.rtl),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomInfoItem(
                              icon: Icons.school,
                              text: MyTexts.yourGrade,
                              info: mainScreenViewModel.user.grade?.name ?? '',
                              textDirection: TextDirection.rtl),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomInfoItem(
                              icon: Icons.money,
                              text: MyTexts.yourBalanceAccount,
                              info: '${mainScreenViewModel.user.balance} EGP'),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h,),

                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
