import 'package:mario_app/Domain/entities/GoogleSignInResponseEntity.dart';

class GoogleSignInResponseDto extends GoogleSignInResponseEntity{
  GoogleSignInResponseDto({
      super.message,
      super.data,});

  GoogleSignInResponseDto.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? GoogleSignInDataDto.fromJson(json['data']) : null;
  }




}

class GoogleSignInDataDto extends GoogleSignInDataEntity{
  GoogleSignInDataDto({
      super.token,});

  GoogleSignInDataDto.fromJson(dynamic json) {
    token = json['token'];
  }




}