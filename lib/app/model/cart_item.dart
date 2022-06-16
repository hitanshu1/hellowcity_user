class CartItem {
  String? resOrStoreId;
  String? storeRestaurentName;
  String? productId;
  String? productName;
  String? rate;
   int qty=1;
  String? amount;
  List<dynamic>? imageDir;
  bool? available;

  CartItem(
      {this.resOrStoreId,
      this.storeRestaurentName,
      this.productId,
      this.productName,
      this.rate, this.qty:1,
      this.amount,
      this.imageDir,this.available:false});

  CartItem.fromJson(Map<String, dynamic> json) {
    print('object$json');
    resOrStoreId = json['res_or_store_id'];
    storeRestaurentName = json['store_restaurent_name'];
    productId = json['product_id'];
    productName = json['product_name'];
    rate = json['rate'];
    qty = int.parse(json['qty']??'1');
    amount = json['amount'];
    available=json['Availability']=='TRUE'?true:false;
    imageDir=json['image_dir']??[];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['res_or_store_id'] = this.resOrStoreId;
    data['store_restaurent_name'] = this.storeRestaurentName;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['rate'] = this.rate;
    data['qty'] = this.qty;
    data['amount'] = this.amount;
    data['image_dir'] = this.imageDir;
    data['Availability']=(this.available??true)?'TRUE':'FALSE';
    return data;
  }
}