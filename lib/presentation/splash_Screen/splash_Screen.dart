import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/authentication/login/view/login_Screen.dart';
import 'package:mario_app/presentation/authentication/register/view/widgets/customClipPath.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash_Screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3), // Change the duration as needed
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.splashBackGroundColor,
        body: Stack(clipBehavior: Clip.none,
          children: [
            Container(

              width: double.infinity,
              child: Image.asset(
                'assets/images/Frame.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 472.h,
              child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 400.h,
                    width: 375.w,
                    padding: EdgeInsets.only(top: 70.h),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(bottom: 24.h),
                          child: Image.asset('assets/images/Progress Bar.png'),
                        ),
                        Text(
                          MyTexts.lets,
                          style: Styles.textStyle30,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
