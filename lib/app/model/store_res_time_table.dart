
import 'package:hellowcity/app/model/usermodel.dart';

class StoreResTimeTable{
  int? id;
  String? storeResId,sundayStartTime,sundayCloseTime,mondayStartTime,mondayCloseTime,tuesdayStarTime,tuesdayCloseTime,
  wednesdayStartTime,wednesdayCloseTime,thursdayStartTime,thursdayCloseTime,fridayStartTime,fridayCloseTime,saturdayStartTime,saturdayCloseTime;
  UserModel? updatedBy;
  bool isOpenToday=false;
  StoreResTimeTable({this.id,this.storeResId,this.fridayCloseTime,this.fridayStartTime,this.isOpenToday=false,this.mondayCloseTime,this.mondayStartTime,this.saturdayCloseTime,
  this.saturdayStartTime,this.sundayCloseTime,this.sundayStartTime,this.thursdayCloseTime,this.thursdayStartTime,this.tuesdayCloseTime,this.tuesdayStarTime,this.wednesdayCloseTime,this.wednesdayStartTime,
  this.updatedBy});
  StoreResTimeTable.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    storeResId = json['store_res_id'];
    sundayStartTime = json['sunday_start_time'];
    sundayCloseTime = json['sunday_close_time'];
    mondayStartTime = json['monday_start_time'];
    mondayCloseTime=json['monday_close_time'];
    tuesdayStarTime = json['tuesday_start_time'];
    tuesdayCloseTime=json['tuesday_close_time'];
    wednesdayStartTime = json['wednesday_start_time'];
    wednesdayCloseTime = json['wednesday_close_time'];
    thursdayStartTime = json['thursday_start_time'];
    thursdayCloseTime = json['thursday_close_time'];
    fridayStartTime = json['friday_start_time'];
    fridayCloseTime = json['friday_close_time'];
    saturdayStartTime = json['saturday_start_time'];
    saturdayCloseTime = json['saturday_close_time'];
    isOpenToday=json['is_open_today']=='false'?false:true;
    updatedBy=json['updated_user']!=null?UserModel.fromJson(json['updated_user']):null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(id!=null){
      data['id'] = id.toString();
    }

    data['sunday_start_time'] = sundayStartTime;
    data['sunday_close_time'] = sundayCloseTime;
    data['monday_start_time'] = mondayStartTime;
    data['monday_close_time'] = mondayCloseTime;
    data['store_res_id']=storeResId;
    data['tuesday_start_time']=tuesdayStarTime;
    data['tuesday_close_time']=thursdayCloseTime;
    data['wednesday_start_time']=wednesdayStartTime;
    data['wednesday_close_time']=wednesdayCloseTime;
    data['thursday_start_time']=thursdayStartTime;
    data['thursday_close_time']=tuesdayCloseTime;
    data['friday_start_time']=fridayStartTime;
    data['friday_close_time']=fridayCloseTime;
    data['saturday_start_time']=saturdayStartTime;
    data['saturday_close_time']=saturdayCloseTime;
    data['updated_by']=updatedBy?.id?.toString()??'';
    data['is_open_today']=isOpenToday.toString();
    return data;
  }

}