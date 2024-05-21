import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/presentation/authentication/register/view/widgets/customClipPath.dart';

class Trial extends StatelessWidget {
  static const String routeName='trial';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(children: [
        Spacer(),
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            color: Colors.white,
            height: 790.h,
            width: double.infinity,
          ),

        ),

      ]),
    );
  }
}
