import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/GoogleSignInResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/repo/authentication_repository.dart';

class LoginWithGmailUseCase{
  AuthRepository authRepository;
  LoginWithGmailUseCase({required this.authRepository});
  Future<Either<Failures,GoogleSignInResponseEntity>>invoke(String accessToken){
    return authRepository.loginWithGmail(accessToken);
  }
}