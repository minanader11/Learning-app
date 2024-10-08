import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/data_source/authentication_data_source.dart';
import 'package:mario_app/Domain/entities/GoogleSignInResponseEntity.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/RegisterResponseEntity.dart';
import 'package:mario_app/Domain/entities/VerifyEmailResponseEntity.dart';
import 'package:mario_app/Domain/entities/centersResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';
import 'package:mario_app/Domain/repo/authentication_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, GradeResponseEntity>> getGrades() {
  return authRemoteDataSource.getGrades();
  }

  @override
  Future<Either<Failures, CentersResponseEntity>> getCenters() {
   return authRemoteDataSource.getCenters();
  }

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name, String email, String password, String phone, String parentPhone, String gradeID, String centerID) {
   return authRemoteDataSource.register(name, email, password, phone, parentPhone, gradeID, centerID);
  }

  @override
  Future<Either<Failures, VerifyEmailResponseEntity>> verify(String email, String code) {
 return authRemoteDataSource.verify(email, code);
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password,String deviceKey) {
    return authRemoteDataSource.login(email, password,deviceKey);
  }

  @override
  Future<Either<Failures, GoogleSignInResponseEntity>> loginWithGmail(String accessToken) {
return authRemoteDataSource.loginWithGmail(accessToken);
  }

}