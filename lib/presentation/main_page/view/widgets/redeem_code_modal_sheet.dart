import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_view_model.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';
import 'package:mario_app/presentation/utils/custom_text_field.dart';

class RedeemCodeModalSheet extends StatefulWidget {
  const RedeemCodeModalSheet({super.key});

  @override
  State<RedeemCodeModalSheet> createState() => _RedeemCodeModalSheetState();
}

class _RedeemCodeModalSheetState extends State<RedeemCodeModalSheet> {

  @override
  Widget build(BuildContext context) {
    MainScreenViewModel mainScreenViewModel=BlocProvider.of<MainScreenViewModel>(context);
    var loginBloc=BlocProvider.of<LoginViewModel>(context);
    return Container(
      height: 600.h,
      color: MyColors.whiteColor,
      padding: const EdgeInsets.all(20),
      child: Form(
        key: mainScreenViewModel.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Text(MyTexts.enterYourCode,style: Styles.textStyle20,)),
              SizedBox(height: 20.h,),
              CustomTextField(color: MyColors.primaryColor,
                  hint: 'enter your code',
                  controller: mainScreenViewModel.codeController,
                  validator: (text) {
                    if (text!.trim().length < 10) {
                      return 'Code must be 10 characters';
                    }
                    return null;
                  }),
              SizedBox(
                height: 10.h,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    mainScreenViewModel.redeemCode(loginBloc.token);
                   // mainScreenViewModel.getProfile(loginBloc.token);
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.check,
                    color: MyColors.whiteColor,
                  ),
                  style: IconButton.styleFrom(
                      backgroundColor: MyColors.primaryColor, iconSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
