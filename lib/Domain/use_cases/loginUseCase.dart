import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/repo/authentication_repository.dart';

class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<Failures, LoginResponseEntity>> invoke(String email, String password){
    return authRepository.login(email, password);
  }
}