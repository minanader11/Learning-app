import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/utils/custom_text_field.dart';

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 57.h, right: 24.w, left: 24.w),
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
                hint: 'enter your code',
                controller: TextEditingController(),
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
    );
  }
}
