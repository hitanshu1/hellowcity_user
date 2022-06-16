
import 'package:hellowcity/app/model/usermodel.dart';

class ProductReview{
  int? id;
  String? productId,title,description,review_by;
  UserModel? reviewUser;
  ProductReview({this.id,this.title,this.description,this.productId,this.review_by,this.reviewUser});
  ProductReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_item_id'];
    reviewUser = json['review_user']!=null?UserModel.fromJson(json['review_user']):null;
    title = json['title'];
    description = json['description'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(id!=null){
      data['id'] = this.id.toString();
    }

    data['product_item_id'] = this.productId;
    data['review_by'] = this.review_by;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }

}