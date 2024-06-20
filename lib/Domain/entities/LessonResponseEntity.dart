import 'package:mario_app/Domain/entities/gradeResponseEntity.dart';

class LessonResponseEntity {
  LessonResponseEntity({
      this.lessons,});


  List<LessonEntity>? lessons;



}

class LessonEntity {
  LessonEntity({
      this.id, 
      this.name, 
      this.price, 
      this.description, 
      this.term, 
      this.section, 
      this.grade, 
      this.hasLesson, 

    this.isFavorite,
      this.image,});


  num? id;
  String? name;
  num? price;
  String? description;
  TermEntity? term;
  SectionEntity? section;
  GradeEntity? grade;
  bool? hasLesson;
  bool? isFavorite;

  String? image;



}



class SectionEntity {
  SectionEntity({
      this.id, 
      this.name,});


  num? id;
  String? name;


}

class TermEntity {
  TermEntity({
      this.id, 
      this.name,});


  num? id;
  String? name;



}