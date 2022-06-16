class AddManagerWaiterCredentials{
  String ?name,phone,password,createdBy,resDhabaID,id;
  AddManagerWaiterCredentials({this.name,this.createdBy,this.resDhabaID,this.phone,this.password,this.id});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(id!=null){
      data['id'] = this.id;
    }
    data['phone'] = this.phone;
    data['created_by'] = this.createdBy;
    data['store_res_id'] = this.resDhabaID;
    data['name']=this.name;
    data['password'] = this.password;
    return data;
  }
}