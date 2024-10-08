import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/GoogleSignInResponseEntity.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/RegisterResponseEntity.dart';
import 'package:mario_app/Domain/entities/VerifyEmailResponseEntity.dart';
import 'package:mario_app/Domain/entities/centersResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';

abstract class AuthRepository{
  Future<Either<Failures,GradeResponseEntity>>getGrades();
  Future<Either<Failures,CentersResponseEntity>>getCenters();
  Future<Either<Failures,RegisterResponseEntity>>register(String name,String email,String password ,String phone , String parentPhone,String gradeID,String centerID);
  Future<Either<Failures,VerifyEmailResponseEntity>>verify(String email,String code);
  Future<Either<Failures,LoginResponseEntity>>login(String email,String password,String deviceKey);
  Future<Either<Failures,GoogleSignInResponseEntity>>loginWithGmail(String accessToken);
}