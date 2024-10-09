

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/Domain/DI.dart';
import 'package:mario_app/Domain/entities/centersResponseEntity.dart';
import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';
import 'package:mario_app/core/imagePaths.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/login/view/login_Screen.dart';
import 'package:mario_app/presentation/authentication/register/view/widgets/customClipPath.dart';
import 'package:mario_app/presentation/authentication/register/view_model/register_states.dart';
import 'package:mario_app/presentation/authentication/register/view_model/register_view_model.dart';
import 'package:mario_app/presentation/authentication/verify_code/view/verify_email_view.dart';
import 'package:mario_app/presentation/utils/custom_text_field.dart';
import 'package:mario_app/presentation/utils/dialog_utils.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static const String routeName = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  // RegisterViewModel viewModel =
  //   RegisterViewModel(getGradesUseCase: injectGetGradesUseCase(),getCentersUseCase: injecetGetGradesUseCase(),registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<RegisterViewModel>(context);
    return PopScope(canPop: true,onPopInvoked: (didPop) {
     Navigator.pop(context);
    },
      child: BlocConsumer<RegisterViewModel, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              DialogUtils.showLoading(context: context);
            } else if (state is RegisterErrorState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                  context: context,
                  message: state.errorMsg,
                  actionName: 'ok',
                  posActionFun: () {
                    Navigator.of(context).pop();
                  });
            } else if (state is RegisterSuccessState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                  context: context,
                  message: 'Register Successfully',
                  actionName: 'ok',
                  posActionFun: () {
                    Navigator.of(context)
                        .pushReplacementNamed(VerifyEmailScreen.routeName);
                  });
            }
          },
          builder: (context, state) => Scaffold(
                backgroundColor: MyColors.greyColor,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Spacer(),
                      ClipPath(
                        clipper: CustomClipPath(),
                        child: Container(
                          margin: EdgeInsets.only(top: 20.h),
                          padding: EdgeInsets.only(top: 60.h, left: 17.w,right: 17.w),
                          color: Colors.white,
                          height: 790.h,
                          width: double.infinity,
                          child: Form(
                            key: viewModel.formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(MyTexts.regsiter,
                                          style: Styles.textStyle40)),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  CustomTextField(
                                    hint: MyTexts.enterYourFullName,
                                    controller: viewModel.fullNameController,
                                    validator: (text) {
                                      if (text == null || text.trim().isEmpty) {
                                        return 'Please Enter Your Name';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 17.h,
                                  ),
                                  CustomTextField(
                                    hint: MyTexts.enterYourMobileNo,
                                    controller: viewModel.mobileNumberController,
                                    validator: (text) {
                                      if (text == null || text.trim().isEmpty) {
                                        return 'Please Enter Your Password';
                                      }
                                      if (text.trim().length < 11) {
                                        return 'phone number must contains at least 11 number';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 17.h,
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
                                    height: 17.h,
                                  ),
                                  CustomTextField(
                                    obscureText: true,
                                    hint: MyTexts.password,
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
                                  SizedBox(
                                    height: 17.h,
                                  ),
                                  CustomTextField(
                                    hint: MyTexts.parentMobileNumber,
                                    controller: viewModel.parentPhoneController,
                                    validator: (text) {
                                      if (text == null || text.trim().isEmpty) {
                                        return 'Please Enter Your Password';
                                      }
                                      if (text.trim().length < 11) {
                                        return 'phone number must contains at least 11 number';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 17.h,
                                  ),
                                  state is GradesLoadingState
                                      ? Center(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                right: 10.w,
                                                top: 10.h,
                                                bottom: 10.h),
                                            margin: EdgeInsets.only(right: 16.w),
                                            height: 64.h,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: MyColors.whiteColor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                border: Border.all(
                                                    color: MyColors
                                                        .textFieldBorderColors,
                                                    width: 2)),
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                CircularProgressIndicator(
                                                  color: MyColors.purpleColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(right: 16.w),
                                          height: 64.h,
                                          decoration: BoxDecoration(
                                              color: MyColors.whiteColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              border: Border.all(
                                                  color: MyColors
                                                      .textFieldBorderColors,
                                                  width: 2)),
                                          child: Center(
                                            child: DropdownButton<GradeEntity>(dropdownColor:MyColors.whiteColor ,
                                              icon:
                                                  Icon(Icons.keyboard_arrow_down),
                                              underline: const SizedBox(),
                                              isExpanded: true,
                                              value: viewModel.selectedGrade,
                                              items: viewModel.grades
                                                  .map((brand) =>
                                                      DropdownMenuItem<
                                                              GradeEntity>(
                                                          value: brand,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10.w),
                                                            child: Text(
                                                                brand.name ??
                                                                    'null',
                                                                style: Styles
                                                                    .textStyle20),
                                                          )))
                                                  .toList(),
                                              onChanged: (value) {
                                                // viewModel.selectedBrand = value!;
                                                viewModel.changeGradeItem(value!);
                                              },
                                              itemHeight: 50,
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: 17.h,
                                  ),
                                  state is GradesLoadingState
                                      ? Center(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                right: 10.w,
                                                top: 10.h,
                                                bottom: 10.h),
                                            margin: EdgeInsets.only(right: 16.w),
                                            height: 64.h,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: MyColors.whiteColor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                    bottomLeft:
                                                    Radius.circular(10),
                                                    bottomRight:
                                                    Radius.circular(10)),
                                                border: Border.all(
                                                    color: MyColors
                                                        .textFieldBorderColors,
                                                    width: 2)),
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                CircularProgressIndicator(
                                                  color: MyColors.purpleColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(right: 16.w),
                                          height: 64.h,
                                          decoration: BoxDecoration(
                                              color: MyColors.whiteColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              border: Border.all(
                                                  color: MyColors
                                                      .textFieldBorderColors,
                                                  width: 2)),
                                          child: Center(
                                            child: DropdownButton<CenterEntity>(dropdownColor:MyColors.whiteColor,
                                              icon:
                                                  Icon(Icons.keyboard_arrow_down),
                                              underline: const SizedBox(),
                                              isExpanded: true,
                                              value: viewModel.selectedCenter,
                                              items: viewModel.centers
                                                  .map((brand) =>
                                                      DropdownMenuItem<
                                                              CenterEntity>(
                                                          value: brand,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10.w),
                                                            child: Text(
                                                                brand.name ??
                                                                    'null',
                                                                style: Styles
                                                                    .textStyle20),
                                                          )))
                                                  .toList(),
                                              onChanged: (value) {
                                                // viewModel.selectedBrand = value!;
                                                viewModel
                                                    .changeCenterItem(value!);
                                              },
                                              itemHeight: 50,
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(LoginScreen.routeName);
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        style: Styles.textStyle14,
                                        children: <TextSpan>[
                                          TextSpan(text: MyTexts.youAlreadyHave),
                                          TextSpan(
                                              text: MyTexts.loginHere,
                                              style: Styles.textStyle14.copyWith(
                                                  color: MyColors
                                                      .buttonsPurpleColor)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        viewModel.changeUserEmail(
                                            viewModel.emailController.text);
                                        print(
                                            'email: ${viewModel.emailController.text}');
                                        viewModel.register();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            MyColors.buttonsPurpleColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            50.r,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 17.h, bottom: 17.h),
                                        child: Text(
                                          MyTexts.regsiter,
                                          style: Styles.textStyle18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
