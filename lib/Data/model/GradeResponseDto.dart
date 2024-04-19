import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';

class GradeResponseDto extends GradeResponseEntity {
  GradeResponseDto({
    super.grades,
  });

  GradeResponseDto.fromJson(dynamic json) {
    if (json['grades'] != null) {
      grades = [];
      json['grades'].forEach((v) {
        grades?.add(GradeDto.fromJson(v));
      });
    }
  }
}

class GradeDto extends GradeEntity {
  GradeDto({
    super.id,
    super.name,
    super.image,
  });

  GradeDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
