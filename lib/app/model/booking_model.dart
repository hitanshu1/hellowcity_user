import 'package:hellowcity/app/model/cabin_model.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';

class BookingModel {
  int? id;
  String? customerId;
  String? startTime;
  String? endTime;
  String? paymentStatus;
  String? paymentAmount;
  String?resID;
  String? status;
  String? date;
  StoreRestaurantModel? storeRestaurant;
  Cabin? cabin;

  BookingModel(
      {this.id,
        this.customerId,
        this.startTime,
        this.status,
        this.endTime,
        this.paymentStatus,this.paymentAmount,this.resID,this.date,this.cabin,this.storeRestaurant});

  BookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    startTime = json['start_time'];
    status = json['status'];
    endTime = json['end_time'];
    resID=json['res_id'];
    paymentStatus = json['payment_status'];
    paymentAmount=json['payment_amount'];
    storeRestaurant=json['store_res']!=null?StoreRestaurantModel.fromJson(json['store_res']):null;
    cabin=json['cabin']!=null?Cabin.fromJson(json['cabin']):null;
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.id!=null){
      data['id'] = this.id.toString();
    }

    if(this.customerId!=null){
      data['customer_id'] = this.customerId;
    }
    if(this.startTime!=null){
      data['start_time'] = this.startTime;
    }


    if(this.status!=null){
      data['status'] = this.status;
    }
    if(this.endTime!=null){
      data['end_time'] = this.endTime;
    }
    if(this.resID!=null){
      data['res_id']=this.resID;
    }


    if(this.paymentStatus!=null){
      data['payment_status']=this.paymentStatus;
    }
    if(this.paymentAmount!=null){
      data['payment_amount']=this.paymentAmount;
    }
    if(this.cabin?.id!=null){
      data['cabin_table_id']=this.cabin?.id.toString();
    }

    if(this.date!=null){
      data['date']=this.date;
    }

    return data;
  }
}