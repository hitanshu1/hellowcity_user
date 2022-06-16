
class UserModel {
  int? id;
  String? name,phoneNumber,profilePic;
  UserModel({this.phoneNumber,this.name,this.id,this.profilePic});
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phoneNumber;
    data['profile_pic'] = this.profilePic;
    return data;
  }

}