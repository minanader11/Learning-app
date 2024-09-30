import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/data_source/main_screen_data_source.dart';
import 'package:mario_app/Domain/entities/GetSingleLessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/LessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/RedeemCodeResponseEntity.dart';
import 'package:mario_app/Domain/entities/buyLessonResponseEntity.dart';
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

  @override
  Future<Either<Failures, LessonResponseEntity>> getLessons(String token) {
   return mainScreenRemoteDataSource.getLessons(token);
  }

  @override
  Future<Either<Failures, BuyLessonResponseEntity>> buyLesson(String token, String lessonId) {
    return mainScreenRemoteDataSource.buyLesson(token, lessonId);
  }

  @override
  Future<Either<Failures, LessonResponseEntity>> getBoughtLessons(String token) {
    return mainScreenRemoteDataSource.getBoughtLessons(token);
  }

  @override
  Future<Either<Failures, LessonResponseEntity>> getFavoriteLessons(String token) {
   return mainScreenRemoteDataSource.getFavoriteLessons(token);
  }

  @override
  Future<Either<Failures, GetSingleLessonResponseEntity>> getSingleLessons(String token, String lessonId) {
    return mainScreenRemoteDataSource.getSingleLessons(token, lessonId);
  }
}
