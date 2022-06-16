

import 'cart_item.dart';

class CartItemByStoreRes{
  String? resOrStoreId;
  String? storeOrResName;
  String? totalAmount;
  String? deliveryCharge;
  List<CartItem>? cartItems;
  CartItemByStoreRes({this.cartItems,this.resOrStoreId,this.storeOrResName,this.totalAmount,this.deliveryCharge});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['resOrStoreId'] = this.resOrStoreId;
    data['storeOrResName']=this.storeOrResName;
    data['totalAmount']=this.totalAmount;
    data['deliveryCharge']=this.deliveryCharge;

    data['cartItems']=this.cartItems!=null?this.cartItems?.map((v) => v.toJson()).toList():null;
    return data;
  }
}