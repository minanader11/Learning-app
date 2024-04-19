import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/RegisterResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/repo/authentication_repository.dart';

class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  Future<Either<Failures,RegisterResponseEntity>>invoke(String name,String email,String password ,String phone , String parentPhone,String gradeID,String centerID){
    return authRepository.register(name, email, password, phone, parentPhone, gradeID, centerID);
  }
}