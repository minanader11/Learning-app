import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/VerifyEmailResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/repo/authentication_repository.dart';

class VerifyUseCase{
  AuthRepository authRepository;
  VerifyUseCase({required this.authRepository});
  Future<Either<Failures,VerifyEmailResponseEntity>>invoke(String email,String code){
   return authRepository.verify(email, code);
  }
}