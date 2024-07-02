import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/LessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/RedeemCodeResponseEntity.dart';
import 'package:mario_app/Domain/entities/buyLessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';

abstract class MainScreenRemoteDataSource{
  Future<Either<Failures,RedeemCodeResponseEntity>>redeemCode(String code,String token);
  Future<Either<Failures,LoginResponseEntity>>getProfile(String token);
  Future<Either<Failures,LessonResponseEntity>>getLessons(String token);
  Future<Either<Failures,BuyLessonResponseEntity>>buyLesson(String token , String lessonId);
  Future<Either<Failures,LessonResponseEntity>>getFavoriteLessons(String token);
  Future<Either<Failures,LessonResponseEntity>>getBoughtLessons(String token);
}