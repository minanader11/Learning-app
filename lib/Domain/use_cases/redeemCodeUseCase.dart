import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/RedeemCodeResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/repo/main_screen_repository.dart';

class RedeemCodeUseCase{
  MainScreenRepository mainScreenRepository;
  RedeemCodeUseCase({required this.mainScreenRepository});
  Future<Either<Failures,RedeemCodeResponseEntity>>invoke(String code,String token){
    return mainScreenRepository.redeemCode(code, token);
  }
}