import 'package:mario_app/Domain/entities/buyLessonResponseEntity.dart';

class BuyLessonResponseDto extends BuyLessonResponseEntity {
  BuyLessonResponseDto({
      super.message,});

  BuyLessonResponseDto.fromJson(dynamic json) {
    message = json['message'];
  }




}