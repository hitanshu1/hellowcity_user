
class AddNewOrderCredentials{
  String? cabinTableId,customerName,customerPhone,storeResId,stuffId,createdBy,storeResName,cabinName,customerId;
  AddNewOrderCredentials({this.storeResId,this.customerName,this.cabinTableId,this.createdBy,this.customerPhone,
    this.stuffId,this.storeResName,this.cabinName,this.customerId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cabin_table_id'] = this.cabinTableId??'';
    data['customer_name'] = this.customerName??'';
    data['customer_phone'] = this.customerPhone??'';
    data['store_res_id'] = this.storeResId??'';
    if(stuffId!=null){
      data['stuff_id'] = this.stuffId??'';
    }

    data['created_by'] = this.createdBy??'';
    data['customer_id'] = this.customerId??'';
    data['cabin_name'] = this.cabinName??'';
    data['store_res_name'] = this.storeResName??'';

    return data;
  }
}