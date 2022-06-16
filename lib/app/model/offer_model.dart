
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/services/app_date_time_format_service.dart';
import 'package:intl/intl.dart';

class StoreResOfferModel{
  int? id;
  String? type,subtype,minimumAmount,minimumItems,startTime,discount,expireTime;
  StoreRestaurantModel? restaurant;
  ProductItemModel? foodItem;
  StoreResOfferModel({this.startTime,this.id,this.restaurant,this.minimumItems,
  this.minimumAmount,this.discount,this.subtype,this.type,this.foodItem,this.expireTime});
  factory StoreResOfferModel.fromMap(Map<dynamic, dynamic> data) {

    final int id=data['id'];
    final String? type=data['type'];
    final String? subtype=data['subtype'];
    final String? minimumAmount=data['minimum_amount'];
    final String? minimumItems=data['minimum_items'];
    final String startTime=data['start_time'];
    final String discount=data['discount'];
    final String expireTime=data['expire_time'];
    final StoreRestaurantModel? restaurant=data['store_res']!=null?StoreRestaurantModel.fromJson(data['store_res']):null;
    final ProductItemModel? foodItem=data['product_item']!=null?ProductItemModel.fromJson(data['product_item']):null;


    return StoreResOfferModel(

        id: id,
        type:type,
        subtype:subtype,
      minimumAmount: minimumAmount,
      minimumItems: minimumItems,
      startTime: startTime,
      discount: discount,
      expireTime: expireTime,
      restaurant: restaurant,
      foodItem: foodItem,

    );
  }
}