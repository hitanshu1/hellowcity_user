
class GetStoreResCredentials{
  String?pinCode,type;
  GetStoreResCredentials({this.type,this.pinCode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pincode'] = this.pinCode;
    data['type'] = this.type;
    return data;
  }

}