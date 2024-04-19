class GradeResponseEntity {
  GradeResponseEntity({
      this.grades,});


  List<GradeEntity>? grades;



}

class GradeEntity {
  GradeEntity({
      this.id, 
      this.name, 
      this.image,});


  num? id;
  String? name;
  dynamic image;



}