class WishListItem {
  String? resOrStoreId;
  String? storeRestaurantName;
  String? productId;
  String? productName;
  String? rate;
  String? qty;
  String? amount;
  List<dynamic>? imageDir;
  String? availability;

  WishListItem(
      {this.resOrStoreId,
        this.storeRestaurantName,
        this.productId,
        this.productName,
        this.rate,
        this.qty,
        this.amount,
        this.imageDir,
        this.availability});

  WishListItem.fromJson(Map<String, dynamic> json) {
    resOrStoreId = json['res_or_store_id'];
    storeRestaurantName = json['store_restaurent_name'];
    productId = json['product_id'];
    productName = json['product_name'];
    rate = json['rate'];
    qty = json['qty'];
    amount = json['amount'];
    imageDir=json['image_dir']??[];
    availability = json['Availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['res_or_store_id'] = this.resOrStoreId;
    data['store_restaurent_name'] = this.storeRestaurantName;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['rate'] = this.rate;
    data['qty'] = this.qty;
    data['amount'] = this.amount;
    data['image_dir'] = this.imageDir;
    data['Availability'] = this.availability;
    return data;
  }
}