
class SendCustomerRequestCredentials{
  String?type,customerId,storeResId;
  SendCustomerRequestCredentials({this.type,this.storeResId,this.customerId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['store_res_id'] = this.storeResId;
    data['type']=this.type;
    return data;
  }
}