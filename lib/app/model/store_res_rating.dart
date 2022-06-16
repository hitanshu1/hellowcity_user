
import 'package:hellowcity/app/model/usermodel.dart';

class StoreResRating{
  int? id;
  double? rating;
  String? storeResId,ratedBy;
  StoreResRating({this.id,this.ratedBy,this.rating,this.storeResId,});
  StoreResRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeResId = json['store_res_id'];
    rating = json['rating']??0;
    ratedBy = json['rated_by'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(id!=null){
      data['id'] = this.id.toString();
    }

    data['store_res_id'] = this.storeResId;
    data['rating'] = this.rating.toString();
    data['rated_by'] = this.ratedBy;
    return data;
  }

}