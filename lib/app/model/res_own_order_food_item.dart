//
// class ResOwnOrderFoodItem{
//   int? id,quantity;
//   String? foodItemId,orderId,name,createdBy,price,resDhabaId,createdAt,updatedAt;
//   ResOwnOrderFoodItem({this.name,this.price,this.resDhabaId,
//     this.createdBy,this.foodItemId,this.createdAt,this.id,this.updatedAt});
//
//   ResOwnOrderFoodItem.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     quantity = int.parse(json['quantity']);
//     foodItemId = json['food_item_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     createdBy = json['created_by'];
//     orderId = json['order_id'];
//     price = json['price'];
//     resDhabaId = json['store_res_id'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['quantity']=this.quantity;
//     data['food_item_id'] = this.foodItemId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['created_by'] = this.createdBy;
//     data['order_id'] = this.orderId;
//     data['price'] = this.price;
//     data['store_res_id'] = this.resDhabaId;
//     return data;
//   }
// }