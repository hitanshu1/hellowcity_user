
class AppResStockModel{
  int? id;
  String ?name,amount,unit,description,note,storeResID,deliveryProductId,status;
  AppResStockModel({this.id,this.name,this.amount,this.description,this.unit,this.note,this.storeResID,this.deliveryProductId,this.status});
  AppResStockModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    note=json['note'];
    unit = json['unit'];
    description = json['description'];
    storeResID=json['store_res_id'];
    deliveryProductId=json['delivery_product_id'];
    status=json['status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if(id!=null){
      data['id'] = this.id.toString();
    }

    data['name'] = this.name;
    data['description'] = this.description??'';
    data['unit'] = this.unit??'';
    data['amount']=this.amount;
    data['note']=this.note??'';
    data['store_res_id']=this.storeResID;
    data['delivery_product_id']=this.deliveryProductId;
    return data;
  }
}