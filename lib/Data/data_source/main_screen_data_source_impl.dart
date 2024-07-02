import 'package:dartz/dartz.dart';
import 'package:mario_app/Data/api/api_service.dart';
import 'package:mario_app/Domain/data_source/main_screen_data_source.dart';
import 'package:mario_app/Domain/entities/LessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/RedeemCodeResponseEntity.dart';
import 'package:mario_app/Domain/entities/buyLessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';

class MainScreenRemoteDataSourceImpl implements MainScreenRemoteDataSource{
  ApiService apiService;
  MainScreenRemoteDataSourceImpl({required this.apiService});
  @override
  Future<Either<Failures, RedeemCodeResponseEntity>> redeemCode(String code, String token) async{
   var either = await apiService.redeemCode(code, token);
   return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> getProfile(String token) async{
    var either = await apiService.getProfile(token);
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, LessonResponseEntity>> getLessons(String token) async{
    var either = await apiService.getLessons(token);
    return either.fold((l) {
     return  Left(l);
    }, (r) {
     return Right(r);
    });
  }

  @override
  Future<Either<Failures, BuyLessonResponseEntity>> buyLesson(String token, String lessonId) async {
  var either = await apiService.buyLesson(token, lessonId);
  return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, LessonResponseEntity>> getBoughtLessons(String token)async {
   var either =await apiService.getBoughtLessons(token);
   return either.fold((l) {
     return Left(l);
   }, (r)
   {
     return Right(r);
   });
  }

  @override
  Future<Either<Failures, LessonResponseEntity>> getFavoriteLessons(String token) async{
    var either =await apiService.getFavoriteLessons(token);
    return either.fold((l) {
      return Left(l);
    }, (r)
    {
      return Right(r);
    });
  }

}