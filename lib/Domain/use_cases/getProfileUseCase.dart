import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/repo/main_screen_repository.dart';

class GetProfileUseCase{
  MainScreenRepository mainScreenRepository;
  GetProfileUseCase({required this.mainScreenRepository});
  Future<Either<Failures,LoginResponseEntity>>invoke(String token){
    return mainScreenRepository.getProfile(token);
  }

}