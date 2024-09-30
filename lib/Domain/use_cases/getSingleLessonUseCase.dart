import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/GetSingleLessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/repo/main_screen_repository.dart';

class GetSingleLessonUseCase{
  MainScreenRepository mainScreenRepository;
  GetSingleLessonUseCase({required this.mainScreenRepository});
  Future<Either<Failures,GetSingleLessonResponseEntity>>invoke(String token,String lessonId){
    return mainScreenRepository.getSingleLessons(token, lessonId);
  }
}