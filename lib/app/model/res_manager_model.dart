
class ResManagerModel{
  int? id;
  String? managerUserID,resDhabaId,createdBy,managerName,phone;

  ResManagerModel({this.id,this.createdBy,this.resDhabaId,this.managerName,this.managerUserID,this.phone});
  ResManagerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    managerUserID = json['manager_user_id'];
    resDhabaId = json['res_dhaba_id'];
    phone = json['phone'];
    createdBy = json['created_by'];
    managerName = json['manager_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['manager_name'] = this.managerName;
    data['phone'] = this.phone;
    data['manager_user_id'] = this.managerUserID;
    data['res_dhaba_id'] = this.resDhabaId;
    data['created_by'] = this.createdBy;
    return data;
  }
}