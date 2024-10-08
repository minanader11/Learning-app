class SocialSignRequestDto {
  SocialSignRequestDto({
      this.provider, 
      this.accessToken,});

  SocialSignRequestDto.fromJson(dynamic json) {
    provider = json['provider'];
    accessToken = json['accessToken'];
  }
  String? provider;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['provider'] = provider;
    map['accessToken'] = accessToken;
    return map;
  }

}