
class ProductRating{
  int? id;
  double? rating;
  String? productId,ratedBy;
  ProductRating({this.id,this.ratedBy,this.rating,this.productId,});
  ProductRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_item_id'];
    rating = json['rating']??0;
    ratedBy = json['rated_by'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(id!=null){
      data['id'] = this.id.toString();
    }

    data['product_item_id'] = this.productId;
    data['rating'] = this.rating.toString();
    data['rated_by'] = this.ratedBy;
    return data;
  }

}