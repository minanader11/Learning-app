import 'package:mario_app/Data/api/api_service.dart';
import 'package:mario_app/Data/data_source/authentication_data_Source.dart';
import 'package:mario_app/Data/repo_impl/authentication_repository_impl.dart';
import 'package:mario_app/Domain/data_source/authentication_data_source.dart';
import 'package:mario_app/Domain/repo/authentication_repository.dart';
import 'package:mario_app/Domain/use_cases/getCentersUseCase.dart';
import 'package:mario_app/Domain/use_cases/getGradesUseCase.dart';
import 'package:mario_app/Domain/use_cases/registerUseCase.dart';
import 'package:mario_app/Domain/use_cases/verifyUseCase.dart';

GetGradesUseCase injectGetGradesUseCase(){
  return GetGradesUseCase(authRepository: injectAuthRepository());
}
AuthRepository injectAuthRepository(){
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiService: injectApiService());
}
ApiService injectApiService(){
  return ApiService();
}
GetCentersUseCase injecetGetGradesUseCase(){
  return GetCentersUseCase(authRepository: injectAuthRepository());
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authRepository: injectAuthRepository());
}
VerifyUseCase injectVerifyUseCase(){
  return VerifyUseCase(authRepository: injectAuthRepository());

}
