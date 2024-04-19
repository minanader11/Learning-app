class CentersResponseEntity {
  CentersResponseEntity({
      this.centers,});


  List<CenterEntity>? centers;



}

class CenterEntity {
  CenterEntity({
      this.id, 
      this.name, 
      this.location, 
      this.phone,});


  num? id;
  String? name;
  String? location;
  num? phone;



}