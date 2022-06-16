
import 'dart:convert';

import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/services/number_service.dart';

import 'address_model.dart';

class CustomerOrderModel{
  List<StoreResWithProductItem>?itemWithStoreList;
  String? grandTotal;
  String? subTotal;
  String? serviceTax;
  String? totalAppCharge;
  String? tax;
  String? deliveryCharge;
  AddressModel? deliveryAddress;
  String? finalAmount;
  String? userId;
  CustomerOrderModel({this.finalAmount,this.serviceTax,this.deliveryAddress,this.deliveryCharge,this.grandTotal,this.itemWithStoreList,this.subTotal,this.tax,this.userId,this.totalAppCharge});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['grand_total'] = this.grandTotal??'';
    data['service_tax']=this.serviceTax??'';
    data['delivery_charge']=this.deliveryCharge??'';
    data['total_app_charge']=this.totalAppCharge??'';
    data['user_id']=this.userId??'';
    data['tax']=this.tax??'';
    data['sub_total']=this.subTotal??'';
    data['final_amount']=finalAmount;
    data['delivery_address']=jsonEncode(this.deliveryAddress?.toJson());
    data['item_with_store_list']=this.itemWithStoreList!=null?jsonEncode(this.itemWithStoreList?.map((v) => v.toJson()).toList()):null;
    return data;
  }
}

class StoreResWithProductItem{
  StoreRestaurantModel? storeRestaurant;
  List<ProductItemModel>?itemList;
  StoreResWithProductItem({this.storeRestaurant,this.itemList});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['store_res'] = this.storeRestaurant?.toJson();
    data['total_amount']=this.itemList!=null?NumberService.getTotalPrice(this.itemList!):"0";

    data['product_items']=this.itemList!=null?this.itemList?.map((v) => v.toJson()).toList():null;
    return data;
  }

}