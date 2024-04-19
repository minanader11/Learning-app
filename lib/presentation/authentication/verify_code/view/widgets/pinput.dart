import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/Domain/DI.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/register/view_model/register_view_model.dart';
import 'package:mario_app/presentation/authentication/verify_code/view_model/Verify_view_model.dart';
import 'package:pinput/pinput.dart';

class PinputExample extends StatefulWidget {
   PinputExample({required this.onPressed}) : super();
  void Function()? onPressed;

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
VerifyScreenViewModel verifyScreenViewModel=VerifyScreenViewModel(verifyUseCase: injectVerifyUseCase());



  @override
  Widget build(BuildContext context) {
    VerifyScreenViewModel verifyScreenViewModel=BlocProvider.of<VerifyScreenViewModel>(context);

    var registerBloc=BlocProvider.of<RegisterViewModel>(context);


    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: MyColors.borderColor),
      ),
    );


    return Form(
      key: verifyScreenViewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 6,
              controller: verifyScreenViewModel.pinController,
              focusNode: verifyScreenViewModel.focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                //return value == '2222' ? null : 'Pin is incorrect';
              },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
               // debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
               // debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: MyColors.focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MyColors.focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: MyColors.fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: MyColors.focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: MyColors.redColor),
              ),
            ),
          ),
          SizedBox(
            height: 56.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: ElevatedButton(
              onPressed:() {
                verifyScreenViewModel.focusNode.unfocus();
                verifyScreenViewModel.formKey.currentState!.validate();
                verifyScreenViewModel.verify(registerBloc.userEmail);
                print(registerBloc.userEmail);
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
                  MyTexts.verify,
                  style: Styles.textStyle20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
