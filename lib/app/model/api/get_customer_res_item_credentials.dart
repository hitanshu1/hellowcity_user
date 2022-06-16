
class GetCustomerResItemCredentials{
  String? userId,itemId,storeResId,pinCode;
  GetCustomerResItemCredentials({this.itemId,this.userId,this.pinCode,this.storeResId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(userId!=null){
      data['user_id'] = this.userId;
    }

    data['product_item_id'] = this.itemId;
    if(pinCode!=null){
      data['pincode']=pinCode;
    }
    data['store_res_id'] = this.storeResId;
    return data;
  }
}