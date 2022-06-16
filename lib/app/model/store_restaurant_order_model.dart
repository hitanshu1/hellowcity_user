import 'package:hellowcity/app/model/cabin_model.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/res_waiter_model.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/model/usermodel.dart';

import 'address_model.dart';


class StoreRestaurantOrderModel {
  String? cabinTableId;
  String? customerId;
  String?cabinName;
  String? storeResName;
  String? customerName;
  String? customerPhone;
  String? orderStatus;
  String? deliveryStatus;
  String? storeResID;
  StuffModel? stuff;
  String? createdBy;
  String? updatedAt;
  String? createdAt;
  String? status;
  String? orderType;
  int? id;
  String?grandTotal,appCharge;
  StoreRestaurantModel? storeRestaurant;
  AddressModel ?deliveryAddress;
  List<ProductItemModel>? productItemList;
  UserModel? customerDetails;
  Cabin? cabin;
  String? overAllDiscount;
  String? finalAmount;
  String? paymentMethod;
  String? grandTotalWithoutTaxDis;
  String? overAllDiscountAmount;
  String? gstAmount;
  String? deliveryCharge;
  String ?serviceTax;


  StoreRestaurantOrderModel(
      {this.cabinTableId,
        this.serviceTax,
        this.deliveryCharge,
        this.customerName,
        this.customerPhone,
        this.orderStatus,
        this.storeResID,
        this.stuff,
        this.createdBy,
        this.updatedAt,
        this.grandTotal,
        this.finalAmount,this.overAllDiscount,
        this.paymentMethod,
        this.createdAt,this.status,this.deliveryStatus,
        this.id,this.storeResName,this.cabin,this.orderType,this.appCharge,this.cabinName,this.customerId,this.storeRestaurant,this.productItemList,this.deliveryAddress});

  StoreRestaurantOrderModel.fromJson(Map<String, dynamic> json) {
    cabinTableId = json['cabin_table_id'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    orderStatus = json['order_status'];
    serviceTax = json['service_tax'];
    storeResID = json['store_res_id'];
    stuff = json['stuff']!=null?StuffModel.fromJson(json['stuff']):null;
    createdBy = json['created_by'];
    deliveryCharge = json['delivery_charge'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    customerId = json['customer_id'].toString();
    cabinName = json['cabin_name'];
    storeResName = json['store_res_name'];
    status=json['order_status'];
    grandTotal=json['grand_total'];
    deliveryStatus=json['delivery_status'];
    appCharge=json['app_charge'];
    cabin=json['cabin_details']!=null?Cabin.fromJson(json['cabin_details']):null;
    orderType=json['order_type'];
    paymentMethod=json['payment_method'];
    finalAmount=json['final_amount'];
    id = json['id'];
    overAllDiscount=json['over_all_discount'];
    overAllDiscountAmount=json['over_all_discount_amount'];
    gstAmount=json['gst_amount'];
    grandTotalWithoutTaxDis=json['grand_total_without_tax_dis'];
    customerDetails=json['customer']!=null?UserModel.fromJson(json['customer']):null;
    deliveryAddress=json['delivery_address']!=null?AddressModel.fromMap(json['delivery_address']):null;

    storeRestaurant = json['store_res'] != null
        ?  StoreRestaurantModel.fromJson(json['store_res'])
        : null;
    if (json['product_item_list'] != null) {
      productItemList = [];
      json['product_item_list'].forEach((v) {
        productItemList?.add( ProductItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['cabin_table_id'] = cabinTableId;
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['order_status'] =orderStatus;
    data['service_tax'] =serviceTax;
    data['res_dhaba_id'] = storeResID;
    data['delivery_charge']=this.deliveryCharge??'';
    data['stuff'] = stuff?.toJson();
    data['created_by'] = createdBy;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['customer_id'] = customerId;
    data['cabin_name'] = cabinName;
    data['store_res_name'] = storeResName;
    data['grand_total']=grandTotal;
    data['order_type']=orderType;
    data['delivery_status']=deliveryStatus;
    data['id'] = id;
    data['final_amount']=finalAmount;
    data['over_all_discount']=overAllDiscount;
    data['payment_method']=paymentMethod??'cash';
    if (storeRestaurant != null) {
      data['store_res'] = storeRestaurant?.toJson();
    }
    if (productItemList != null) {
      data['product_item_list'] =
          productItemList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}