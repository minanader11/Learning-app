import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/data_source/main_screen_data_source.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/RedeemCodeResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/repo/main_screen_repository.dart';

class MainScreenRepoImpl implements MainScreenRepository {
  MainScreenRemoteDataSource mainScreenRemoteDataSource;

  MainScreenRepoImpl({required this.mainScreenRemoteDataSource});

  @override
  Future<Either<Failures, RedeemCodeResponseEntity>> redeemCode(
      String code, String token) {
    return mainScreenRemoteDataSource.redeemCode(code, token);
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> getProfile(String token) {
   return mainScreenRemoteDataSource.getProfile(token);
  }
}
