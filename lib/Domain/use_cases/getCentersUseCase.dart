import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/centersResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/repo/authentication_repository.dart';

class GetCentersUseCase{
  AuthRepository authRepository;
  GetCentersUseCase({required this.authRepository});
  Future<Either<Failures,CentersResponseEntity>>invoke(){
    return authRepository.getCenters();
  }
}