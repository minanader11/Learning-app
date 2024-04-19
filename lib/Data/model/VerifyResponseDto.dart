import 'package:mario_app/Domain/entities/VerifyEmailResponseEntity.dart';

class VerifyResponseDto  extends VerifyEmailResponseEntity{
  VerifyResponseDto({
      this.message,});

  VerifyResponseDto.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;



}