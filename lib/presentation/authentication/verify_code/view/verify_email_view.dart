import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/Domain/DI.dart';
import 'package:mario_app/core/imagePaths.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/login/view/login_Screen.dart';
import 'package:mario_app/presentation/authentication/register/view_model/register_view_model.dart';
import 'package:mario_app/presentation/authentication/verify_code/view/widgets/pinput.dart';
import 'package:mario_app/presentation/authentication/verify_code/view_model/VerifyScreenStates.dart';
import 'package:mario_app/presentation/authentication/verify_code/view_model/Verify_view_model.dart';
import 'package:mario_app/presentation/utils/dialog_utils.dart';

class VerifyEmailScreen extends StatefulWidget {
  VerifyEmailScreen({super.key});

  static const String routeName = 'VerifyEmailScreen';

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  VerifyScreenViewModel verifyScreenViewModel =
      VerifyScreenViewModel(verifyUseCase: injectVerifyUseCase());

  @override
  Widget build(BuildContext context) {
    //var registerBloc=BlocProvider.of<RegisterViewModel>(context);
    return BlocProvider<VerifyScreenViewModel>(
      create: (context) => verifyScreenViewModel,
      child: BlocListener<VerifyScreenViewModel, VerifyScreenStates>(
        listener: (context, state) {
          if (state is VerifyLoadingState) {
            DialogUtils.showLoading(context: context);
          } else if (state is VerifyErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: state.errorMsg,
                actionName: 'ok',
                posActionFun: () {
                  Navigator.of(context).pop();
                });
          } else if (state is VerifySuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: 'Verify Email Successfully',
                actionName: 'ok',
                posActionFun: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                });
          }
        },
        child: Scaffold(
          backgroundColor: MyColors.verifyCodeScreenBackGroundColo,
          body: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Form(
              //key: viewModel.formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(margin: EdgeInsets.only(top: 68.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: MyColors.purpleColor),
                    height: 64.h,
                    width: 64.h,child: Icon(Icons.person,color: MyColors.profileIconColor,size: 40.w,),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    MyTexts.verifyEmail,
                    style: Styles.textStyle30,
                  ),
                  SizedBox(
                    height:16.h,
                  ),
                  Text(
                    MyTexts.enterCode,
                    style: Styles.textStyle18
                        .copyWith(color: Color(0xff736B66)),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  // Text(
                  //   MyTexts.email,
                  //   style: Styles.textStyle18,
                  // ),
                  // SizedBox(
                  //   height: 24.h,
                  // ),
                  // CustomTextField(
                  //   hint: MyTexts.enterYourEmailAddress,
                  //   controller: TextEditingController(),
                  //   validator: (text) {
                  //     if (text == null || text.trim().isEmpty) {
                  //       return 'Please Enter Your Email';
                  //     }
                  //     bool emailValid = RegExp(
                  //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //         .hasMatch(text);
                  //     if (!emailValid) {
                  //       return 'Please enter Valid Email';
                  //     }
                  //     return null;
                  //   },),
                  // SizedBox(
                  //   height: 32.h,
                  // ),
                  // Text(
                  //   MyTexts.password,
                  //   style: Styles.textStyle18,
                  // ),
                  // SizedBox(height: 24.h),
                  // CustomTextField(
                  //   hint: MyTexts.enterYourPassword,
                  //   controller: TextEditingController(),
                  //   validator: (text) {
                  //     if (text == null || text.trim().isEmpty) {
                  //       return 'Please Enter Your Password';
                  //     }
                  //     if (text.trim().length < 6) {
                  //       return 'Password must contains at least 6 characters';
                  //     }
                  //     return null;
                  //   },),
                  // SizedBox(
                  //   height: 16.h,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 15.w),
                  //   child: Text(
                  //     MyTexts.forgetPassword,
                  //     style: Styles.textStyle18,
                  //     textAlign: TextAlign.end,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 56.h,
                  // ),
                  PinputExample(onPressed: () {
                    // verifyScreenViewModel.focusNode.unfocus();
                    // verifyScreenViewModel.formKey.currentState!.validate();
                    // verifyScreenViewModel.verify(registerBloc.userEmail);
                  }),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
