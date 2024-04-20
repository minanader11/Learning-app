import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/Domain/DI.dart';
import 'package:mario_app/presentation/authentication/login/view/login_Screen.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_view_model.dart';
import 'package:mario_app/presentation/authentication/register/view/register_screen.dart';
import 'package:mario_app/presentation/authentication/register/view_model/register_view_model.dart';

import 'package:mario_app/presentation/authentication/verify_code/view/verify_email_view.dart';
import 'package:mario_app/presentation/main_page/view/main_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(
          getGradesUseCase: injectGetGradesUseCase(),
          getCentersUseCase: injecetGetGradesUseCase(),
          registerUseCase: injectRegisterUseCase())
        ..getGrades()
        ..getCenters(),
    ),
    BlocProvider<LoginViewModel>(create: (context) => LoginViewModel(loginUseCase: injectLoginUseCase()),)
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // SplashScreen.routeName: (context) => SplashScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          MainScreen.routeName: (context) => MainScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          // MainScreen.routeName: (context) => MainScreen(),
          VerifyEmailScreen.routeName: (context) => VerifyEmailScreen(),
        },
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}
