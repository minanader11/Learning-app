import 'package:mario_app/Domain/entities/centersResponseEntity.dart';

class CentersResponseDto extends CentersResponseEntity {
  CentersResponseDto({
      super.centers,});

  CentersResponseDto.fromJson(dynamic json) {
    if (json['centers'] != null) {
      centers = [];
      json['centers'].forEach((v) {
        centers?.add(Centers.fromJson(v));
      });
    }
  }



}

class Centers extends CenterEntity{
  Centers({
      super.id,
      super.name,
      super.location,
      super.phone,});

  Centers.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    phone = json['phone'];
  }


}