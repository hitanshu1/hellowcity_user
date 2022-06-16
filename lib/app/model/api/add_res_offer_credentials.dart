
class AddStoreResOfferCredentials{
  String? type,subtype,resDhabaId,itemId,minimumAmount,minimumItems,startTime,discount,
  endTime,id;

  AddStoreResOfferCredentials({this.type,this.resDhabaId,this.startTime,this.id,
  this.endTime,this.minimumItems,this.minimumAmount,this.subtype,this.itemId,this.discount});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_res_id'] = this.resDhabaId;
    data['type'] = this.type;
    data['subtype'] = this.subtype;
    data['start_time'] = this.startTime;
    data['discount'] = this.discount;
    data['expire_time'] = this.endTime;
    if( itemId!=null){
      data['product_item_id'] = this.itemId;
    }
    if(minimumAmount!=null){
      data['minimum_amount'] = this.minimumAmount;
    }
    if(minimumItems!=null){
      data['minimum_items'] = this.minimumItems;
    }
    if(id!=null){
      data['id']=this.id;
    }

    return data;
  }
}