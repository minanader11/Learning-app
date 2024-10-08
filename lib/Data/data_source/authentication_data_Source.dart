import 'package:dartz/dartz.dart';
import 'package:mario_app/Data/api/api_service.dart';
import 'package:mario_app/Domain/data_source/authentication_data_source.dart';
import 'package:mario_app/Domain/entities/GoogleSignInResponseEntity.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/RegisterResponseEntity.dart';
import 'package:mario_app/Domain/entities/VerifyEmailResponseEntity.dart';
import 'package:mario_app/Domain/entities/centersResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Either<Failures, GradeResponseEntity>> getGrades() async {
    var either = await apiService.getGrades();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, CentersResponseEntity>> getCenters() async{

    var either = await apiService.getCenters();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name, String email, String password, String phone, String parentPhone, String gradeID, String centerID) async{
    var either = await apiService.register(name, email, password, phone, parentPhone, gradeID, centerID);
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, VerifyEmailResponseEntity>> verify(String email, String code) async{
    var either = await apiService.verify(email, code);
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password,String deviceKey) async{
    var either =await apiService.login(email, password,deviceKey);
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, GoogleSignInResponseEntity>> loginWithGmail(String accessToken) async{
    var either = await apiService.loginWithGmail(accessToken);
    return either.fold((l) => Left(l), (r) => Right(r),);
  }
}
