
class RestaurantStockModel{
  int? id;
  String? name,description,amount,price,note,storeResID;
  RestaurantStockModel({this.note,this.price,this.amount,this.description,this.name,this.id,this.storeResID});
  RestaurantStockModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    amount = json['amount'];
    price = json['price'];
    note = json['note'];
    storeResID = json['store_res_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(id!=null){
      data['id'] = this.id.toString();
    }

    data['name'] = this.name;
    data['description'] = this.description;
    data['store_res_id'] = this.storeResID;
    data['amount'] = this.amount;
    data['price'] = this.price;
    data['note'] = this.note;
    return data;
  }
}