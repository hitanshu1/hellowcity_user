
class AddStoreResCredentials{
  String ?resName,address,phone,pinCode,ownerId,gstNumber,id;
  String type;
  var resImage,fssaiDoc,tradeDoc,gstDoc;
  AddStoreResCredentials({this.resImage,this.fssaiDoc,this.gstDoc,this.tradeDoc,this.resName,
    this.id,this.phone,this.pinCode,this.gstNumber,this.address,this.ownerId,required this.type});
  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    if(id!=null){
      data['id']=this.id??'';
    }
    data['name'] = this.resName??'';
    data['address'] = this.address??'';
    data['phone']=this.phone??'';
    data['pincode']=this.pinCode??'';
    data['owner_id']=this.ownerId??'';
    data['gst_number']=this.gstNumber??'';
    data['type']=this.type;
    data['validity'] =DateTime(2023,1,1).toIso8601String() ;

    return data;
  }
}