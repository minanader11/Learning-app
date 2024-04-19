class VerifyRequestDto {
  VerifyRequestDto({
      this.email, 
      this.code,});

  String? email;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['code'] = code;
    return map;
  }

}