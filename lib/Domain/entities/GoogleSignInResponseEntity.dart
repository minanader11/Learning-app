class GoogleSignInResponseEntity {
  GoogleSignInResponseEntity({
      this.message, 
      this.data,});


  String? message;
  GoogleSignInDataEntity? data;



}

class GoogleSignInDataEntity {
  GoogleSignInDataEntity({
      this.token,});

  String? token;


}