
class AddCabinTableCredentials{
  String? storeResID,name,type,subtype,createdBy,capacity,id;

  AddCabinTableCredentials({this.type,this.name,this.createdBy,this.storeResID,this.capacity,this.subtype,this.id});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_res_id'] = this.storeResID;
    if(id!=null){
      data['id']=this.id;
    }

    data['name'] = this.name;
    data['type'] = this.type;
    data['subtype'] = this.subtype;
    data['capacity'] = this.capacity;
    data['created_by'] = this.createdBy;
    data['status'] = 'Free';
    return data;
  }
}