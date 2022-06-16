
class StuffModel{
  int? id;
  String? stuffName,stuffUserId,createdBy,storeResId,phone;

  StuffModel({this.id,this.createdBy,this.stuffName,this.storeResId,this.stuffUserId,this.phone});
  StuffModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stuffUserId = json['stuff_user_id'];
    storeResId = json['store_res_id'];
    phone = json['phone'];
    createdBy = json['created_by'];
    stuffName = json['stuff_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stuff_name'] = this.stuffName;
    data['phone'] = this.phone;
    data['stuff_user_id'] = this.stuffUserId;
    data['store_res_id'] = this.storeResId;
    data['created_by'] = this.createdBy;
    return data;
  }
}