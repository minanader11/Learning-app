import 'package:mario_app/Domain/entities/LessonResponseEntity.dart';
import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';

class GetSingleLessonResponseEntity {
  GetSingleLessonResponseEntity({
      this.lesson,});


  SingleLessonResponseEntity? lesson;



}

class SingleLessonResponseEntity {
  SingleLessonResponseEntity({
      this.id, 
      this.name, 
      this.price, 
      this.description, 
      this.term, 
      this.section, 
      this.grade, 
      this.isFavourite, 
      this.hasLesson, 
      this.lessonVideoUrl, 
      this.homeworkUrl, 
      this.image,});


  num? id;
  String? name;
  num? price;
  String? description;
  TermEntity? term;
  SectionEntity? section;
  GradeEntity? grade;
  bool? isFavourite;
  bool? hasLesson;
  String? lessonVideoUrl;
  String? homeworkUrl;
  String? image;



}

