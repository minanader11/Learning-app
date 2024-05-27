import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mario_app/Domain/DI.dart';
import 'package:mario_app/core/imagePaths.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_states.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_view_model.dart';
import 'package:mario_app/presentation/authentication/register/view/register_screen.dart';
import 'package:mario_app/presentation/authentication/register/view/widgets/customClipPath.dart';
import 'package:mario_app/presentation/main_page/view/main_screen.dart';
import 'package:mario_app/presentation/utils/custom_text_field.dart';
import 'package:mario_app/presentation/utils/dialog_utils.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //LoginViewModel viewModel =LoginViewModel(loginUseCase: injectLoginUseCase());
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = BlocProvider.of<LoginViewModel>(context)
      ..setupPushNotification();
    return BlocListener<LoginViewModel,LoginStates>(
      //bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
        //  DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.errorMsg,
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pop();
              });
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          var ftoast = FToast();
          ftoast.init(context);
          ftoast.showToast(
            gravity: ToastGravity.TOP,
            toastDuration: Duration(seconds: 1),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.greenAccent,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text("Login Successfully"),
                ],
              ),
            ),
          );
          Navigator.of(context).pushReplacementNamed(MainScreen.routeName);

          // DialogUtils.showMessage(
          //     context: context,
          //     message: 'Login Successfully',
          //     actionName: 'ok',
          //     posActionFun: () {
          //       Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
          //     });
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.greyColor,
        body: Form(
          key: viewModel.formKey,
          child: SingleChildScrollView(
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.only(top: 60.h, left: 17.w,right: 17.w),
                color: Colors.white,
                height: 790.h,
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        MyTexts.login,
                        style: Styles.textStyle40,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
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
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      obscureText: true,
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
                      },
                    ),

                    // Padding(
                    //   padding: EdgeInsets.only(right: 15.w),
                    //   child: Text(
                    //     MyTexts.forgetPassword,
                    //     style: Styles.textStyle18,
                    //     textAlign: TextAlign.end,
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // InkWell(
                    //   onTap: () => Navigator.of(context)
                    //       .pushNamed(RegisterScreen.routeName),
                    //   child: Text(
                    //     MyTexts.dontHaveAccount,
                    //     textAlign: TextAlign.center,
                    //     style: Styles.textStyle18.copyWith(color:MyColors.darkGreyColor),
                    //   ),
                    // ),
                    InkWell(onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RegisterScreen.routeName);
                    },
                      child: RichText(
                        text: TextSpan(

                          style:Styles.textStyle14,
                          children: <TextSpan>[
                            TextSpan(text: MyTexts.dontHaveAccount),
                            TextSpan(text: MyTexts.registerHere, style: Styles.textStyle14.copyWith(color: MyColors.buttonsPurpleColor)),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.login();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.buttonsPurpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              50.r,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 17.h, bottom: 17.h),
                          child: Text(
                            MyTexts.login,
                            style: Styles.textStyle18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
