import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/RedeemCodeResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';

abstract class MainScreenRepository{
  Future<Either<Failures,RedeemCodeResponseEntity>>redeemCode(String code,String token);
  Future<Either<Failures,LoginResponseEntity>>getProfile(String token);
}