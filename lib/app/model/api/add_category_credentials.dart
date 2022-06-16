
class AddCategoryCredentials{
  String? id;
  String? name,description,resDhabaId,createdBy;
  AddCategoryCredentials({this.name,this.description,this.resDhabaId,this.createdBy,this.id});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(id!=null){
      data['id']=this.id;
    }

    data['name'] = this.name??'';
    data['description'] = this.description??'';
    data['store_res_id']=this.resDhabaId;
    data['created_by']=this.createdBy;
    return data;
  }
}