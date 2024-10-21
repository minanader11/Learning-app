import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mario_app/Domain/entities/GetSingleLessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/LessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/use_cases/buyLessonUseCase.dart';
import 'package:mario_app/Domain/use_cases/getBoughtLessonsUseCase.dart';
import 'package:mario_app/Domain/use_cases/getFavoriteLessonsUseCase.dart';
import 'package:mario_app/Domain/use_cases/getLessonsUseCase.dart';
import 'package:mario_app/Domain/use_cases/getProfileUseCase.dart';
import 'package:mario_app/Domain/use_cases/getSingleLessonUseCase.dart';
import 'package:mario_app/Domain/use_cases/redeemCodeUseCase.dart';
import 'package:mario_app/presentation/add_card/view/add_card_screen.dart';
import 'package:mario_app/presentation/cart/view/cart_tab.dart';
import 'package:mario_app/presentation/favorite/view/favorite_tab.dart';
import 'package:mario_app/presentation/home/view/home_tab.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/profile/view/profile_tab.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
class MainScreenViewModel extends Cubit<MainScreenStates> {
  MainScreenViewModel(
      {required this.redeemCodeUseCase,
      required this.getProfileUseCase,
      required this.getLessonsUseCase,
      required this.buyLessonUseCase,
      required this.getBoughtLessonsUseCase,
      required this.getFavoriteLessonsUseCase,
      required this.getSingleLessonUseCase})
      : super(MainScreenInitialState());
  List<Widget> tabs = [
    AddCardScreen(),
    FavoriteTab(),
    HomeTab(),
    CartTab(),
    ProfileTab(),
  ];
  int selectedIndex = 2;

  TextEditingController codeController = TextEditingController();
  RedeemCodeUseCase redeemCodeUseCase;
  GetProfileUseCase getProfileUseCase;
  UserResponseEntity user = UserResponseEntity();
  GetLessonsUseCase getLessonsUseCase;
  BuyLessonUseCase buyLessonUseCase;
  List<LessonEntity> lessons = [];
  List<LessonEntity> favLessons = [];
  List<LessonEntity> boughtLessons = [];
  num lessonId = 0;
  GetFavoriteLessonsUseCase getFavoriteLessonsUseCase;
  GetBoughtLessonsUseCase getBoughtLessonsUseCase;
  Widget? tab;
  GetSingleLessonUseCase getSingleLessonUseCase;
  SingleLessonResponseEntity lesson=SingleLessonResponseEntity();
  YoutubePlayerController? youtubeController;
  var _idController = TextEditingController();
  var _seekToController = TextEditingController();
  var _videoMetaData = const YoutubeMetaData();
  var _playerState = PlayerState.unknown;
  bool _isPlayerReady = false;
  var  paymentController = TextEditingController();
  Map<String, dynamic>? paymentIntentData;
  changeIndex(int newIndex) {
    emit(MainScreenInitialState());
    selectedIndex = newIndex;
    emit(ChangeNavigationBarState());
  }

  redeemCode(String token, bool validate) async {
    //bool validate=  formKey.currentState!.validate();

    if (validate) {
      emit(RedeemCodeLoadingState());
      var response = await redeemCodeUseCase.invoke(codeController.text, token);
      response.fold((l) {
        emit(RedeemCodeErrorState(errMsg: l.errMsg));
      }, (r) {
        emit(RedeemCodeSuccessState());
      });
    }
  }

  getProfile(String token) async {
    emit(GetProfileILoadingState());
    var response = await getProfileUseCase.invoke(token);
    response.fold((l) {
      emit(GetProfileErrorState(errMsg: l.errMsg));
    }, (r) {
      user = r.user!;
      emit(GetProfileSuccessState());
    });
  }

  getLessons(String token) async {
    emit(GetLessonsILoadingState());
    var response = await getLessonsUseCase.invoke(token);
    response.fold((l) {
      print('get lessons error');
      emit(GetLessonsErrorState(errMsg: l.errMsg));
    }, (r) {
      print('success');
      lessons = r.lessons!;
      emit(GetLessonsSuccessState());
    });
  }

  buyLesson(String token, String lessonId) async {
    //emit(BuyLessonRequestState());
    emit(BuyLessonLoadingState());
    var response = await buyLessonUseCase.invoke(token, lessonId);
    response.fold((l) {
      emit(BuyLessonErrorState());
    }, (r) {
      emit(BuyLessonSuccessState());
    });
  }

  requestBuyLesson() {
    emit(BuyLessonRequestState());
  }

  changeLessonID(num newLessonId) {
    emit(ChangeLessonIdInitalState());
    lessonId = newLessonId;
    emit(ChangeLessonIdSuccessState());
  }

  getFavoriteLessons(String token) async {
    emit(GetFavoriteLessonsLoadingState());
    var response = await getFavoriteLessonsUseCase.invoke(token);
    response.fold((l) {
      print('get lessons error');
      emit(GetFavoriteLessonsFailureState(errMsg: l.errMsg));
    }, (r) {
      print('success');
      favLessons = r.lessons!;
      emit(GetFavoriteLessonsSuccessState());
    });
  }

  getBoughtLessons(String token) async {
    emit(GetBoughtLessonsLoadingState());
    var response = await getBoughtLessonsUseCase.invoke(token);
    response.fold((l) {
      print('get lessons error');
      emit(GetBoughtLessonsFailureState(errMsg: l.errMsg));
    }, (r) {
      print('success');
      boughtLessons = r.lessons!;
      emit(GetBoughtLessonsSuccessState());
    });
  }

  changeTab() {
    emit(ChangeLessonIdInitalState());
    tab = tabs[selectedIndex];
    emit(ChangeTabSuccessState());
  }
  getSingleLesson(String token,String lessonId)async{
    emit(GetSingleLessonLoadingState());
    var response= await getSingleLessonUseCase.invoke(token, lessonId);
    response.fold((l) {
      emit(GetSingleLessonFailureState(errMsg: l.errMsg));
    }, (r) {
      lesson=r.lesson!;
      print("lesson ${lesson.lessonVideoUrl}");
      String videoId;
     youtubeController = YoutubePlayerController(
        initialVideoId: getYoutubeVideoId(lesson!.lessonVideoUrl!)!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      )..addListener(listener);
      emit(GetSingleLessonSuccessState());

    });
  }
  String? getYoutubeVideoId(String url) {
    final uri = Uri.parse(url);
    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
    } else if (uri.queryParameters.containsKey('v')) {
      return uri.queryParameters['v'];
    }
    return null;
  }
  void listener() {
    if (_isPlayerReady  && !youtubeController!.value.isFullScreen) {
      print("enterrrrr");
        _playerState = youtubeController!.value.playerState;
        _videoMetaData = youtubeController!.metadata;
       
    }
  }
  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      emit(PaymentLoadingState());
      paymentIntentData = await createPaymentIntent(amount, currency);
      const gpay = PaymentSheetGooglePay(
        merchantCountryCode: "US",
        currencyCode: "USD",
        testEnv: true,
      );
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            applePay: const PaymentSheetApplePay(
              buttonType: PlatformButtonType.buy,
              merchantCountryCode: 'US',
            ),
           googlePay: gpay,
            merchantDisplayName: 'mina nader',
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],

          ),
        );

        displayPaymentSheet();

      }

    } catch (e, s) {
      print('exception:$e$s');
      emit(PaymentFailureState(errMsg: e.toString()));
    }
  }
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization': 'Bearer sk_test_51QBub9Ez0AR5aTDOMStaWfLpjHqHtZZyNPXG38LGha5XUX50UaWbyovZ6lOgwnoonjiNLuqwIc65ENedrf6yRjXl005lWXYVcO',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );

      return jsonDecode(response.body.toString());
    } catch (e) {
      print(e.toString());
    }
  }
  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then(
            (value) {
              print("mina");
              emit(PaymentSuccessState());
            },
      );

    } on StripeException catch (e) {
      print('Payment failed: ${e.error.localizedMessage}');
      emit(PaymentFailureState(errMsg: e.error.localizedMessage!));
    } catch (e) {
      print('An unexpected error occurred: $e');
      emit(PaymentFailureState(errMsg: e.toString()));
    }
  }
}
