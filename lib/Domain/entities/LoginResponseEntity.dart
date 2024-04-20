import 'package:mario_app/Domain/entities/centersResponseEntity.dart';
import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';

class LoginResponseEntity {
  LoginResponseEntity({
      this.user, 
      this.token,});


  UserResponseEntity? user;
  String? token;



}

class UserResponseEntity {
  UserResponseEntity({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.grade, 
this.parentPhone,
    this.balance,
      this.center,});


  num? id;
  String? name;
  String? email;
  String? phone;
  GradeEntity? grade;

  CenterEntity? center;
  num? balance;
  String?parentPhone;



}



