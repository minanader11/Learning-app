class RedeemCodeRequest {
  RedeemCodeRequest({
      this.code,});
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    return map;
  }

}