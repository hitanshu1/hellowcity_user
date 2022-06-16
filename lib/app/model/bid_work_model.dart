

import 'address_model.dart';
import 'usermodel.dart';

class BidWorkModel{
  String? jobTitle;
  String? jobType;
  String? category;
  DateTime? expireDate;
  AddressModel? address;
  String? budget;
  String? description;
  List<String>? images;
  UserModel? createdBy;
  BidWorkModel({this.address,this.category,this.jobType,this.description,this.budget,this.jobTitle,
  this.images,this.expireDate,this.createdBy});
}