
import 'package:file_picker/file_picker.dart';

class AddStoreResProductItemCredentials{
  String ?name,description,category,price,resDhabaID,subCategory,createdBy,id;
  bool? deliveryStatus,activeStatus;
  PlatformFile? file;
  List<PlatformFile>?files;
  AddStoreResProductItemCredentials({this.files,this.file,this.name,this.description,this.category,this.price,this.resDhabaID,this.subCategory,this.id,
  this.createdBy,this.activeStatus,this.deliveryStatus});
  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    if(id!=null){
      data['id']=this.id??'';
    }
    data['name'] = this.name??'';
    data['description'] = this.description??'';
    data['created_by']=this.createdBy??'';
    data['price']=this.price??'';
    data['store_res_id']=this.resDhabaID??'';
    data['subcategory']=this.subCategory??'';
    data['category'] = this.category??'';
    data['delivery_status']=this.deliveryStatus?.toString()??'false';
    data['delivery_status']=this.activeStatus?.toString()??'false';

    return data;
  }
}