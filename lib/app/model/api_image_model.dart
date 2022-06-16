
class ApiImageModel{
  int? id;
  String? imageUrl;
  ApiImageModel({this.imageUrl,this.id});
  ApiImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    return data;
  }

}