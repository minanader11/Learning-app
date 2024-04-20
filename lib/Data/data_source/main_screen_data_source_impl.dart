import 'package:dartz/dartz.dart';
import 'package:mario_app/Data/api/api_service.dart';
import 'package:mario_app/Domain/data_source/main_screen_data_source.dart';
import 'package:mario_app/Domain/entities/LoginResponseEntity.dart';
import 'package:mario_app/Domain/entities/RedeemCodeResponseEntity.dart';
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

}