import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_view_model.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';
import 'package:mario_app/presentation/utils/custom_text_field.dart';
import 'package:mario_app/presentation/utils/dialog_utils.dart';

class AddCardScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mainScreenCubit =
    BlocProvider.of<MainScreenViewModel>(context);
    var loginCubit=BlocProvider.of<LoginViewModel>(context);
    return BlocConsumer<MainScreenViewModel,MainScreenStates>(listener:  (context, state) {
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
      }
    },
      builder: (context, state) => Container(
        margin: EdgeInsets.only(top: 57.h, right: 24.w, left: 24.w),
        child: SingleChildScrollView(
          child: Form(key:_formKey ,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  MyTexts.addCard,
                  style: Styles.textStyle20.copyWith(color: MyColors.blackColor),
                ),
                SizedBox(height: 44.h,),
                Text(MyTexts.enterYourCode,style: Styles.textStyle14.copyWith(color: MyColors.blackColor),),
                SizedBox(height: 8.h,),
                Container(height: 62.h,
                  child: CustomTextField(color: MyColors.primaryColor,
                      hint: '',
                      controller: mainScreenCubit.codeController,
                      validator: (text) {
                        if (text!.trim().length < 10) {
                          return 'Code must be 10 characters';
                        }
                        return null;
                      }),
                ),
                SizedBox(height: 273.h,),
                ElevatedButton(
                  onPressed: () {
                    bool validate= _formKey.currentState!.validate();
                 mainScreenCubit.redeemCode(loginCubit.token,validate);
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
    );
  }
}
