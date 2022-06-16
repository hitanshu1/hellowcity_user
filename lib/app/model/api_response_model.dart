

import 'package:hellowcity/app/model/usermodel.dart';

class ApiResponseModel{
  int? status;
  dynamic data;
  UserModel? user;
  String? message;
  String ? token;
  bool? alreadyHaveAccount;
  ApiResponseModel({this.data,this.status,this.user,this.message,this.token,this.alreadyHaveAccount});
  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    user = json['user']!=null?UserModel.fromJson(json['user']):null;
    message = json['message'];
    token=json['token'];
    alreadyHaveAccount=json['already_have']??false;

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['status'] = this.status;
    data['message']=this.message;
    data['user'] = this.user?.toJson();
    data['token']=this.token;
    return data;
  }

}