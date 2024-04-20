
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      this.keyboardType = TextInputType.text,
      required this.controller,
      required this.validator,
      this.obscureText = false,this.color=MyColors.whiteColor});

  String hint;
  TextInputType keyboardType;
  TextEditingController controller;
  String? Function(String?) validator;
  bool obscureText;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 16.w),
      child: TextFormField(
        style: TextStyle(color: MyColors.primaryColor),
        decoration: InputDecoration(filled: true,fillColor: MyColors.whiteColor,
          hintText: hint,
          hintStyle: Styles.textStyle16.copyWith(color: MyColors.blackColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: color, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyColors.primaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyColors.redColor, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color:MyColors.redColor, width: 2),
          ),
        ),
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: obscureText,

      ),
    );
  }
}
