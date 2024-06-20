import 'package:mario_app/Data/model/GradeResponseDto.dart';
import 'package:mario_app/Data/model/LessonResponseDto.dart';
import 'package:mario_app/Domain/entities/GetSingleLessonResponseEntity.dart';

class GetSingleLessonResponseDto extends GetSingleLessonResponseEntity{
  GetSingleLessonResponseDto({
      super.lesson,});

  GetSingleLessonResponseDto.fromJson(dynamic json) {
    lesson = json['lesson'] != null ? SingleLessonResponseDto.fromJson(json['lesson']) : null;
  }




}

class SingleLessonResponseDto extends SingleLessonResponseEntity{
  SingleLessonResponseDto({
      super.id,
      super.name,
      super.price,
      super.description,
      super.term,
      super.section,
      super.grade,
      super.isFavourite,
      super.hasLesson,
      super.lessonVideoUrl,
      super.homeworkUrl,
      super.image,});

  SingleLessonResponseDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    term = json['term'] != null ? TermDto.fromJson(json['term']) : null;
    section = json['section'] != null ? SectionDto.fromJson(json['section']) : null;
    grade = json['grade'] != null ? GradeDto.fromJson(json['grade']) : null;
    isFavourite = json['is_favourite'];
    hasLesson = json['has_lesson'];
    lessonVideoUrl = json['lesson_video_url'];
    homeworkUrl = json['homework_url'];
    image = json['image'];
  }




}

