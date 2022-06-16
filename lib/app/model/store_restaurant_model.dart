import 'package:hellowcity/app/model/store_res_time_table.dart';

class StoreRestaurantModel {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? fssaiDocUrl;
  String? tradeLicenseUrl;
  String? gstDocUrl;
  String? address;
  String? phone;
  String? pincode;
  String? ownerId;
  String? gstNumber;
  String? validity;
  String?type;
  String? status;
  String? gstPercentage;
  String? userType;
  bool? bookAvailable;
  StoreResTimeTable? timeTable;

  StoreRestaurantModel(
      {this.id,
        this.name,
        this.timeTable,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.fssaiDocUrl,
        this.tradeLicenseUrl,
        this.gstDocUrl,
        this.address,
        this.phone,
        this.pincode,
        this.ownerId,
        this.gstNumber,
        this.userType,
        this.validity,this.type,this.status,this.gstPercentage,this.bookAvailable=false});

  StoreRestaurantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image']==''?null:json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fssaiDocUrl = json['fssai_doc_url']==''?null:json['fssai_doc_url'];
    tradeLicenseUrl = json['trade_license_url']==''?null:json['trade_license_url'];
    gstDocUrl = json['gst_doc_url']==''?null:json['gst_doc_url'];
    address = json['address'];
    phone = json['phone'];
    pincode = json['pincode'];
    ownerId = json['owner_id'];
    gstNumber = json['gst_number'];
    validity = json['validity'];
    status=json['status'];
    gstPercentage=json['gst_percentage'];
    type=json['type'];
    bookAvailable=json['book_available']=='true'?true:false;
    userType=json['user_type'];
    timeTable=json['time_table']!=null?StoreResTimeTable.fromJson(json['time_table']):null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id??'';
    data['name'] = this.name??'';
    data['image'] = this.image??'';
    data['created_at'] = this.createdAt??'';
    data['updated_at'] = this.updatedAt??'';
    data['fssai_doc_url'] = this.fssaiDocUrl??'';
    data['trade_license_url'] = this.tradeLicenseUrl??'';
    data['gst_doc_url'] = this.gstDocUrl??'';
    data['address'] = this.address??'';
    data['phone'] = this.phone??'';
    data['pincode'] = this.pincode??'';
    data['owner_id'] = this.ownerId??'';
    data['gst_number'] = this.gstNumber??'';
    data['validity'] = this.validity??'';
    data['type']=this.type;
    data['book_available']=this.bookAvailable.toString();
    return data;
  }
}