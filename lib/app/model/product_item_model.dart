
import 'package:hellowcity/app/model/api_image_model.dart';
import 'package:hellowcity/app/model/offer_model.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';

class ProductItemModel{
  int? id;
  StoreResOfferModel? offer;
  StoreRestaurantModel? storeRestaurant;
  bool?isCart,isWishList,available,deliveryStatus,activeStatus;
  int quantity=1;
  double? rating;
  String ?name,imageUrl,createdBy,description,price,storeResId,subCategory,category,createdAt,upDatedAt,type;
  List<ApiImageModel>?imageList;

  ProductItemModel({required this.quantity,this.storeRestaurant,this.isCart,this.isWishList,this.storeResId,this.id,this.createdAt,this.createdBy,this.name,this.category,this.description,this.imageUrl,
  this.price,this.subCategory,this.upDatedAt,this.rating,this.offer,this.available,this.type,this.imageList,this.activeStatus,this.deliveryStatus});
  ProductItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    upDatedAt = json['updated_at'];
    createdBy = json['created_by'];
    description = json['description'];
    price = json['price'];
    quantity=int.tryParse(json['quantity']??'1')??1;
    storeResId = json['store_res_id'];
    subCategory = json['subcategory'];
    rating=json['rating']!=null?(double.tryParse(json['rating'])??0):0;
    available=json['available']??true;
    deliveryStatus=json['delivery_status']=='true'?true:false;
    activeStatus=json['active_status']=='true'?true:false;
    category = json['category'];
    isCart=json['is_cart']??false;
    type=json['type'];
    storeRestaurant=json['store_res']!=null?StoreRestaurantModel.fromJson(json['store_res']):null;
    isWishList=json['is_wish_list']??false;
    if(json['offer']!=null){
      offer=json['offer']!=null?StoreResOfferModel.fromMap(json['offer']):null;
    }
    if (json['image_list'] != null) {
      imageList = [];
      json['image_list'].forEach((v) {
        imageList?.add(ApiImageModel.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id?.toString()??'';
    data['name'] = this.name??'';
    data['image_url'] = this.imageUrl??'';
    data['created_at'] = this.createdAt??'';
    data['updated_at'] = this.upDatedAt??'';
    data['created_by'] = this.createdBy??'';
    data['description'] = this.description??'';
    data['price'] = this.price??'';
    data['store_res_id'] = this.storeResId??'';
    data['subcategory'] = this.subCategory??'';
    data['category'] = this.category??'';
    data['quantity']=this.quantity.toString();

    data['type']=this.type;
    return data;
  }

}