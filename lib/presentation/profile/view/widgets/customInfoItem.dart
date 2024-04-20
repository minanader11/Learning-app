import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';

class CustomInfoItem extends StatelessWidget {
  CustomInfoItem({required this.text, required this.info,this.textDirection=TextDirection.ltr});

  String text;
  String info;
 TextDirection textDirection;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
        Text(
          text,
          style: Styles.textStyle18.copyWith(color: MyColors.primaryColor),
        ),
        SizedBox(
         height: 16.h,
        ),
        Container(
            padding:  EdgeInsets.only(top: 18.h ,left:16.w ,right: 16.w
            ),height: 54.h,
          width: 398.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: 1,
              color: MyColors.primaryColor,
            ),
          ),

            child: Container(child: Text(info,style: Styles.textStyle14.copyWith(color: MyColors.primaryColor),textDirection: textDirection,)),
          ),

      ]),
    );
  }
}
