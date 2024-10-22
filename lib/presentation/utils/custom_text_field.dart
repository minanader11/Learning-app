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
      this.obscureText = false,
      this.color = MyColors.whiteColor});

  String hint;
  TextInputType keyboardType;
  TextEditingController controller;
  String? Function(String?) validator;
  bool obscureText;
  Color color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.textStyle20,
      decoration: InputDecoration(
       fillColor: color,
        filled: true,
        hintText: hint,
        hintStyle: Styles.textStyle20,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: MyColors.textFieldBorderColors, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: MyColors.darkGreyColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: MyColors.redColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: MyColors.redColor, width: 2),
        ),
      ),
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
    );
  }
}
