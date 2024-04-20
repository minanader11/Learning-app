import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/Domain/DI.dart';
import 'package:mario_app/Domain/entities/centersResponseEntity.dart';
import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
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
    var viewModel=BlocProvider.of<RegisterViewModel>(context);
    return BlocConsumer<RegisterViewModel,RegisterStates>(
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
                 Navigator.of(context).pushReplacementNamed(VerifyEmailScreen.routeName);
              });
        }
      },
      builder: (context, state) => Scaffold(
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
                        top: 91.h, left: 97.w, right: 96.w, bottom: 46.h),
                    child: Image.asset(
                      MyTexts.routeImage,
                    ),
                  ),
                  Text(
                    MyTexts.fullName,
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
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
                    height: 32.h,
                  ),
                  Text(
                    MyTexts.mobileNumber,
                    style: Styles.textStyle18,
                  ),
                  SizedBox(height: 24.h),
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
                    height: 32.h,
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
                    },
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    MyTexts.password,
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
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
                    height: 32.h,
                  ),
                  Text(
                    MyTexts.parentMobileNumber,
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
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
                    height: 32.h,
                  ),
                  Text(
                    MyTexts.grade,
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is GradesLoadingState
                      ? Center(
                          child: Container(
                          height: 64.h,
                          width: 50.w,
                          child: CircularProgressIndicator(),
                        ))
                      : Container(
                          margin: EdgeInsets.only(right: 16.w),
                          height: 64.h,
                          decoration: BoxDecoration(
                              color: MyColors.whiteColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              border: Border.all(
                                  color: MyColors.whiteColor, width: 2)),
                          child: Center(
                            child: DropdownButton<GradeEntity>(
                              underline: const SizedBox(),
                              isExpanded: true,
                              value: viewModel.selectedGrade,
                              items: viewModel.grades
                                  .map((brand) => DropdownMenuItem<GradeEntity>(
                                      value: brand,
                                      child: Text(
                                        brand.name ?? 'null',
                                        style: Styles.textStyle18.copyWith(
                                            color: MyColors.blackColor),
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
                    height: 32.h,
                  ),
                  Text(
                    MyTexts.center,
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
                  ), state is GradesLoadingState
                      ? Center(
                      child: Container(
                        height: 64.h,
                        width: 50.w,
                        child: CircularProgressIndicator(),
                      ))
                      : Container(
                    margin: EdgeInsets.only(right: 16.w),
                    height: 64.h,
                    decoration: BoxDecoration(
                        color: MyColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        border: Border.all(
                            color: MyColors.whiteColor, width: 2)),
                    child: Center(
                      child: DropdownButton<CenterEntity>(
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: viewModel.selectedCenter,
                        items: viewModel.centers
                            .map((brand) => DropdownMenuItem<CenterEntity>(
                            value: brand,
                            child: Text(
                              brand.name ?? 'null',
                              style: Styles.textStyle18.copyWith(
                                  color: MyColors.blackColor),
                            )))
                            .toList(),
                        onChanged: (value) {
                          // viewModel.selectedBrand = value!;
                          viewModel.changeCenterItem(value!);
                        },
                        itemHeight: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.changeUserEmail(viewModel.emailController.text);
                        print('email: ${viewModel.emailController.text}');
                        viewModel.register();

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
                          MyTexts.signUP,
                          style: Styles.textStyle20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
