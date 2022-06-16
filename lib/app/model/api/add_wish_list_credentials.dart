
class AddWishListCredentials{
  String storeResId,productItemId,userID;
  AddWishListCredentials({required this.productItemId,required this.storeResId,required this.userID});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_res_id'] = this.storeResId;
    data['product_item_id'] = this.productItemId;
    data['user_id'] = this.userID;
    return data;
  }
}