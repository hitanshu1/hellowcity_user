
class AppResDeliveryProduct{
  int? id;
  String ?name,price,unit,description;
  AppResDeliveryProduct({this.id,this.name,this.price,this.description,this.unit});
  AppResDeliveryProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    unit = json['unit'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['unit'] = this.unit;
    data['name'] = this.name;
    return data;
  }
}