


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mario_app/core/theme/colors.dart';


abstract class Styles {
  static   TextStyle textStyle18 = GoogleFonts.urbanist(textStyle:TextStyle(
      fontSize: 18.sp, color: MyColors.whiteColor ,fontWeight: FontWeight.w800));
  static TextStyle textStyle24 = TextStyle(
      fontSize: 24.sp, color: MyColors.whiteColor, fontWeight: FontWeight.w600);
  static TextStyle textStyle16 = TextStyle(
      fontSize: 16.sp, color: MyColors.whiteColor, fontWeight: FontWeight.w300);
  static TextStyle textStyle20 = GoogleFonts.urbanist(textStyle:TextStyle(
      fontSize: 20.sp, color: MyColors.textFieldLabelsColor ,fontWeight: FontWeight.w400));
  static TextStyle textStyle12 = TextStyle(
      fontSize: 12.sp, color: MyColors.whiteColor, fontWeight: FontWeight.w400);
  static TextStyle textStyle14 = GoogleFonts.urbanist(textStyle:TextStyle(
      fontSize: 14.sp, color: MyColors.darkGreyColor ,fontWeight: FontWeight.bold));
  static TextStyle textStyle40 = GoogleFonts.urbanist(textStyle:TextStyle(
      fontSize: 40.sp, color: MyColors.purpleColor ,fontWeight: FontWeight.bold));
  static TextStyle textStyle30 = GoogleFonts.urbanist(textStyle:TextStyle(
      fontSize: 30.sp, color: MyColors.purpleColor ,fontWeight: FontWeight.w900));
}
