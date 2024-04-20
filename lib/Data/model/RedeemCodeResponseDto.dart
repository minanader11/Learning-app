import 'package:mario_app/Domain/entities/RedeemCodeResponseEntity.dart';

class RedeemCodeResponseDto extends RedeemCodeResponseEntity {
  RedeemCodeResponseDto({
      super.message,});

  RedeemCodeResponseDto.fromJson(dynamic json) {
    message = json['message'];
  }




}