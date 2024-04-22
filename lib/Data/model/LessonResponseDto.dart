import 'package:mario_app/Data/model/GradeResponseDto.dart';
import 'package:mario_app/Domain/entities/LessonResponseEntity.dart';

class LessonResponseDto extends LessonResponseEntity {
  LessonResponseDto({
    super.lessons,
  });

  LessonResponseDto.fromJson(dynamic json) {
    if (json['lessons'] != null) {
      lessons = [];
      json['lessons'].forEach((v) {
        lessons?.add(LessonDto.fromJson(v));
      });
    }
  }
}

class LessonDto extends LessonEntity {
  LessonDto({
    super.id,
    super.name,
    super.price,
    super.description,
    super.term,
    super.section,
    super.grade,
    super.hasLesson,
    super.lessonVideoUrl,
    super.homeworkUrl,
    super.image,
  });

  LessonDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    term = json['term'] != null ? TermDto.fromJson(json['term']) : null;
    section =
        json['section'] != null ? SectionDto.fromJson(json['section']) : null;
    grade = json['grade'] != null ? GradeDto.fromJson(json['grade']) : null;
    hasLesson = json['has_lesson'];
    lessonVideoUrl = json['lesson_video_url'];
    homeworkUrl = json['homework_url'];
    image = json['image'];
  }
}

class SectionDto extends SectionEntity {
  SectionDto({
    super.id,
    super.name,
  });

  SectionDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}

class TermDto extends TermEntity {
  TermDto({
    super.id,
    super.name,
  });

  TermDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}
