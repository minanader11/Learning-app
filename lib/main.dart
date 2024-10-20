import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mario_app/Domain/DI.dart';
import 'package:mario_app/presentation/authentication/login/view/login_Screen.dart';
import 'package:mario_app/presentation/authentication/login/view_model/login_view_model.dart';
import 'package:mario_app/presentation/authentication/register/view/register_screen.dart';
import 'package:mario_app/presentation/authentication/register/view/trial_widget.dart';
import 'package:mario_app/presentation/authentication/register/view_model/register_view_model.dart';

import 'package:mario_app/presentation/authentication/verify_code/view/verify_email_view.dart';
import 'package:mario_app/presentation/lesson_detailed_screen/view/lesson_detailed_screen.dart';
import 'package:mario_app/presentation/main_page/view/main_screen.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mario_app/presentation/splash_Screen/splash_Screen.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey = "pk_test_51QBub9Ez0AR5aTDO0scfoAnOhSdf685PVUlP8TLQDpTmEAHStLRqasFcgumePUwzc5wy96bagdJGOxux7B1ttrCX00DdUQFCL3";
// to load secret key from .env file
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';

  await dotenv.load(fileName: "assets/.env");
  await Stripe.instance.applySettings();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(
          getGradesUseCase: injectGetGradesUseCase(),
          getCentersUseCase: injecetGetGradesUseCase(),
          registerUseCase: injectRegisterUseCase())
        ..getGrades()
        ..getCenters(),
    ),
    BlocProvider<LoginViewModel>(
      create: (context) => LoginViewModel(loginUseCase: injectLoginUseCase(),loginWithGmailUseCase: injectLoginWithGmailUseCase()),
    ),
    BlocProvider(
      create: (context) => MainScreenViewModel(
          redeemCodeUseCase: injectRedeemCodeUseCase(),
          getProfileUseCase: injectGetProfileUseCase(),
          getLessonsUseCase: injectGetLessonsUseCase(),
          buyLessonUseCase: injectBuyLessonUseCase(),
          getBoughtLessonsUseCase: injectGetBoughtLessonsUseCase(),
          getFavoriteLessonsUseCase: injectGetFavoriteLessonsUseCase(),
      getSingleLessonUseCase: injectGetSingleLessonUseCase()),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        theme: ThemeData(canvasColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        routes: {
          // SplashScreen.routeName: (context) => SplashScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          MainScreen.routeName: (context) => MainScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          // MainScreen.routeName: (context) => MainScreen(),
          VerifyEmailScreen.routeName: (context) => VerifyEmailScreen(),
          Trial.routeName: (context) => Trial(),
          SplashScreen.routeName: (context) => SplashScreen(),
          LessonDetailedScreen.routeName:(context) => LessonDetailedScreen(),
        },
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
