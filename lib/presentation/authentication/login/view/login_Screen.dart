
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_states.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_view_model.dart';
import 'package:mario_app/presentation/authentication/register/view/register_screen.dart';
import 'package:mario_app/presentation/utils/custom_text_field.dart';
import 'package:mario_app/presentation/utils/dialog_utils.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel =LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocListener(bloc:viewModel,listener:(context, state) {
      if (state is LoginLoadingState) {
        DialogUtils.showLoading(context: context);
      } else if (state is LoginErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: state.errorMsg,
            actionName: 'no',
            posActionFun: () {
              Navigator.of(context).pop();
            });
      } else if(state is LoginSuccessState){
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: 'Login Successfully',
            actionName: 'ok',
            posActionFun: () {
              //Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            });
      }
    },
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 91.h, left: 97.w, right: 96.w, bottom: 87.h),
                      child: Image.asset(
                        MyTexts.routeImage,
                      ),
                    ),
                    Text(
                      MyTexts.welcomeText,
                      style: Styles.textStyle24,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      MyTexts.pleaseSignText,
                      style: Styles.textStyle16,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      MyTexts.email,
                      style: Styles.textStyle18,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextField(
                        hint: MyTexts.enterYourEmailAddress,
                        controller: viewModel.emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Your Email';
                          }
                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'Please enter Valid Email';
                          }
                          return null;
                        },),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      MyTexts.password,
                      style: Styles.textStyle18,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                        hint: MyTexts.enterYourPassword,
                        controller: viewModel.passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          if (text.trim().length < 6) {
                            return 'Password must contains at least 6 characters';
                          }
                          return null;
                        },),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Text(
                        MyTexts.forgetPassword,
                        style: Styles.textStyle18,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(
                      height: 56.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 15.w),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.login();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 23.h, bottom: 23.h),
                          child: Text(
                            MyTexts.login,
                            style: Styles.textStyle20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    InkWell(onTap: () => Navigator.of(context).pushNamed(RegisterScreen.routeName),
                      child: Text(
                        MyTexts.dontHaveAccount,
                        textAlign: TextAlign.center,
                        style: Styles.textStyle18,
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
