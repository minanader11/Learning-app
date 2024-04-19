import 'package:dartz/dartz.dart';

import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';
import 'package:mario_app/Domain/repo/authentication_repository.dart';

class GetGradesUseCase{
  AuthRepository authRepository;
  GetGradesUseCase({required this.authRepository});
  Future<Either<Failures,GradeResponseEntity>>invoke(){
    return authRepository.getGrades();
  }
}