class RegisterRequestDto {
  RegisterRequestDto({
      this.name, 
      this.email, 
      this.password, 
      this.phone, 
      this.parentPhone, 
      this.gradeId, 
      this.centerId,});


  String? name;
  String? email;
  String? password;
  String? phone;
  String? parentPhone;
  String? gradeId;
  String? centerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['parent_phone'] = parentPhone;
    map['grade_id'] = gradeId;
    map['center_id'] = centerId;
    return map;
  }

}