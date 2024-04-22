import 'package:dartz/dartz.dart';
import 'package:mario_app/Domain/entities/buyLessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/failure.dart';
import 'package:mario_app/Domain/repo/main_screen_repository.dart';

class BuyLessonUseCase{
  MainScreenRepository mainScreenRepository;
  BuyLessonUseCase({required this.mainScreenRepository});
  Future<Either<Failures,BuyLessonResponseEntity>>invoke(String token , String lessonId){
    return mainScreenRepository.buyLesson(token, lessonId);
  }
}