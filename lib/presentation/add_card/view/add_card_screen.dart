import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_view_model.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';
import 'package:mario_app/presentation/utils/custom_text_field.dart';
import 'package:mario_app/presentation/utils/dialog_utils.dart';
import 'package:http/http.dart' as http;

class AddCardScreen extends StatefulWidget {
  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();

  // var paymentController = TextEditingController();
  // Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    var mainScreenCubit = BlocProvider.of<MainScreenViewModel>(context);
    var loginCubit = BlocProvider.of<LoginViewModel>(context);
    return BlocConsumer<MainScreenViewModel, MainScreenStates>(
      listener: (context, state) {
        if (state is RedeemCodeLoadingState) {
          DialogUtils.showLoading(context: context);
        } else if (state is RedeemCodeErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.errMsg,
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pop();
              });
        } else if (state is RedeemCodeSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Code Redeeming Successfully',
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pop();
              });
        } else if(state is PaymentLoadingState){
          DialogUtils.showLoading(context: context);
        } else if(state is PaymentSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Payment Done Successfully',
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pop();
              });
        } else if(state is PaymentFailureState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.errMsg,
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pop();
              });
        }
      },
      builder: (context, state) => Container(
        margin: EdgeInsets.only(right: 24.w, left: 24.w),
        child: SingleChildScrollView(
          child: Container(height: 700.h,padding: EdgeInsetsDirectional.only(top: 50.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    MyTexts.addCard,
                    style:
                        Styles.textStyle20.copyWith(color: MyColors.blackColor),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    MyTexts.enterYourCode,
                    style:
                        Styles.textStyle14.copyWith(color: MyColors.blackColor),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    height:50.h,

                    child: CustomTextField(
                        color: MyColors.whiteColor,
                        hint: '',
                        controller: mainScreenCubit.codeController,
                        validator: (text) {
                          if (text!.trim().length < 10) {
                            return 'Code must be 10 characters';
                          }
                          return null;
                        }),
                  ),
                  // CardField(controller: CardEditController(),onCardChanged: (details) {
                  //
                  // },),
                  SizedBox(height: 5.h,),
                  TextFormField(
                    controller: mainScreenCubit.paymentController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required field';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter an amount',
                      fillColor: const Color(0xffF5F5F5),
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xff1D275C),
                          width: 2.01,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffCCCCCC),
                          width: 2.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffD6001A),
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffF0642F),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.buttonsPurpleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          50.r,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint(mainScreenCubit.paymentController.text);
                        var paymentAmount =
                            int.parse(mainScreenCubit.paymentController.text) * 100;
                        mainScreenCubit.makePayment(
                            amount: paymentAmount.toString(), currency: "USD");
                        //   makePayment(amount: paymentAmount.toString(), currency: "USD");
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 17.h, bottom: 17.h),
                      child: Text(
                        'Make Payment',
                        style: Styles.textStyle18,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 273.h,
                  // ),
                  SizedBox(height: 10.h,),
                  ElevatedButton(
                    onPressed: () {
                      bool validate = _formKey.currentState!.validate();
                      mainScreenCubit.redeemCode(loginCubit.token, validate);
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
                        MyTexts.add,
                        style: Styles.textStyle18,
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

// Future<void> makePayment(
//     {required String amount, required String currency}) async {
//   try {
//     paymentIntentData = await createPaymentIntent(amount, currency);
//     const gpay = PaymentSheetGooglePay(
//       merchantCountryCode: "US",
//       currencyCode: "USD",
//       testEnv: true,
//     );
//     if (paymentIntentData != null) {
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           googlePay: gpay,
//           merchantDisplayName: 'Adiwele',
//           paymentIntentClientSecret: paymentIntentData!['client_secret'],
//           customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
//         ),
//       );
//       displayPaymentSheet();
//     }
//   } catch (e, s) {
//     debugPrint('exception:$e$s');
//   }
// }
// createPaymentIntent(String amount, String currency) async {
//   try {
//     Map<String, dynamic> body = {
//       'amount': amount,
//       'currency': currency,
//       'payment_method_types[]': 'card'
//     };
//     var response = await http.post(
//       Uri.parse('https://api.stripe.com/v1/payment_intents'),
//       body: body,
//       headers: {
//         'Authorization': 'Bearer sk_test_51QBub9Ez0AR5aTDOMStaWfLpjHqHtZZyNPXG38LGha5XUX50UaWbyovZ6lOgwnoonjiNLuqwIc65ENedrf6yRjXl005lWXYVcO',
//         'Content-Type': 'application/x-www-form-urlencoded'
//       },
//     );
//
//     return jsonDecode(response.body.toString());
//   } catch (e) {
//     debugPrint(e.toString());
//   }
// }
// displayPaymentSheet() async {
//   try {
//     await Stripe.instance.presentPaymentSheet().then(
//           (value) {},
//     );
//   } on StripeException catch (e) {
//     debugPrint('Payment failed: ${e.error.localizedMessage}');
//   } catch (e) {
//     debugPrint('An unexpected error occurred: $e');
//   }
// }
}
