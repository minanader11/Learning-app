import 'package:flutter/material.dart';
import 'package:mario_app/Domain/entities/LessonResponseEntity.dart';
import 'package:mario_app/presentation/home/view/widgets/lesson_Item.dart';

class LessonList extends StatelessWidget{
  LessonList({required this.lessons});
  List<LessonEntity> lessons;
  @override
  Widget build(BuildContext context) {
   return Expanded(child: ListView.builder(padding: EdgeInsets.zero,itemBuilder: (context, index) => LessonItem(lesson: lessons[index]),itemCount:lessons.length,));
  }
  
}