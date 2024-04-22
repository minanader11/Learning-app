class BuyLessonRequest {
  BuyLessonRequest({
      this.lessonId,});

  BuyLessonRequest.fromJson(dynamic json) {
    lessonId = json['lesson_id'];
  }
  String? lessonId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lesson_id'] = lessonId;
    return map;
  }

}