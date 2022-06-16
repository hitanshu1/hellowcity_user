
class AddOrderItemCredentials{
  String? quantity;
  String? orderID,foodItemID,name,price,createdBy,resDhabaId,resDhabaName,cabinName,customerId;
  AddOrderItemCredentials({this.resDhabaId,this.createdBy,this.price,this.name,
    this.foodItemID,this.orderID,this.quantity,this.resDhabaName,this.cabinName,this.customerId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderID;
    data['product_item_id'] = this.foodItemID;
    data['quantity']=this.quantity;
    data['price']=this.price;
    data['name']=this.name;
    data['created_by']=this.createdBy;
    data['store_res_id']=this.resDhabaId;
    data['customer_id'] = this.customerId??'';
    data['cabin_name'] = this.cabinName??'';
    data['store_res_name'] = this.resDhabaName??'';
    return data;
  }
}