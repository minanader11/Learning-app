import 'package:mario_app/Data/model/CentersResponseDto.dart';
import 'package:mario_app/Data/model/GradeResponseDto.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
    super.user,
    super.token,
    this.message
  });

  LoginResponseDto.fromJson(dynamic json) {
    user = json['user'] != null ? UserResponseDto.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
  }
  String? message;
}

class UserResponseDto extends UserResponseEntity {
  UserResponseDto({
    super.id,
    super.name,
    super.email,
    super.phone,
    super.grade,
    super.center,
  });

  UserResponseDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    grade =
        json['grade'] != null ? GradeResponseDto.fromJson(json['grade']) : null;
    center = json['center'] != null
        ? CentersResponseDto.fromJson(json['center'])
        : null;
  }
}
