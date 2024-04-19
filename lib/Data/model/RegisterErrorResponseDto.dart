class RegisterErrorResponseDto {
  RegisterErrorResponseDto({
      this.message, 
      this.errors,});

  RegisterErrorResponseDto.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? RegsiterErrorsDto.fromJson(json['errors']) : null;
  }
  String? message;
  RegsiterErrorsDto? errors;



}

class RegsiterErrorsDto {
  RegsiterErrorsDto({
      this.email,});

  RegsiterErrorsDto.fromJson(dynamic json) {
    email = json['email'] != null ? json['email'].cast<String>() : [];
  }
  List<String>? email;



}