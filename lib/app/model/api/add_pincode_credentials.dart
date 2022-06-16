
class AddPinCodeCredentials{
  String? resDhabaId,pinCode,status,id;

  AddPinCodeCredentials({this.pinCode,this.resDhabaId,this.status,this.id});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_res_id'] = this.resDhabaId;
    data['status'] = this.status;
    data['pincode'] = this.pinCode;
    if(id!=null){
      data['id']=this.id;
    }

    return data;
  }
}