class LoginRequestDto {
  LoginRequestDto({
      this.email, 
      this.password,this.deviceKey});


  String? email;
  String? password;
  String? deviceKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['device_key']=deviceKey;
    return map;
  }

}