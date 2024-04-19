import 'package:mario_app/Domain/entities/RegisterResponseEntity.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
      super.message,
  this.errors});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? RegisterErrorsDto.fromJson(json['errors']) : null;
  }

  RegisterErrorsDto? errors;




}


class RegisterErrorsDto {
  RegisterErrorsDto({
    this.email,});

  RegisterErrorsDto.fromJson(dynamic json) {
    email = json['email'] != null ? json['email'].cast<String>() : [];
  }
  List<String>? email;



}