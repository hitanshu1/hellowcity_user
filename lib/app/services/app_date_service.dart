
import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/model/store_res_time_table.dart';
import 'package:hellowcity/app/services/app_date_time_format_service.dart';

class AppDateService{


  //checks if restaurant is open or closed
// returns true if current time is in between given timestamps
//openTime HH:MMAM or HH:MMPM same for closedTime
  static bool _checkRestaurantStatus(String openTime, String closedTime) {
    //NOTE: Time should be as given format only
    //10:00PM
    //10:00AM

    // 01:60PM ->13:60
    //Hrs:Min
    //if AM then its ok but if PM then? 12+time (12+10=22)

    TimeOfDay timeNow = TimeOfDay.now();
    print('openTime==$openTime');
    String openHr = openTime.substring(0, 2);
    String openMin = openTime.substring(3, 5);
    String openAmPm = openTime.substring(5).replaceAll(' ', '');

    TimeOfDay timeOpen;
    if (openAmPm == "AM") {
      //am case
      if (openHr == "12") {
        //if 12AM then time is 00
        timeOpen = TimeOfDay(hour: 00, minute: int.parse(openMin));
      } else {
        timeOpen =
            TimeOfDay(hour: int.parse(openHr), minute: int.parse(openMin));
      }
    } else {
      //pm case
      if (openHr == "12") {
//if 12PM means as it is
        timeOpen =
            TimeOfDay(hour: int.parse(openHr), minute: int.parse(openMin));
      } else {
//add +12 to conv time to 24hr format
        timeOpen =
            TimeOfDay(hour: int.parse(openHr) + 12, minute: int.parse(openMin));
      }
    }

    String closeHr = closedTime.substring(0, 2);
    String closeMin = closedTime.substring(3, 5);
    String closeAmPm = closedTime.substring(5).replaceAll(' ', '');

    TimeOfDay timeClose;

    if (closeAmPm == "AM") {
      //am case
      if (closeHr == "12") {
        timeClose = TimeOfDay(hour: 0, minute: int.parse(closeMin));
      } else {
        timeClose =
            TimeOfDay(hour: int.parse(closeHr), minute: int.parse(closeMin));
      }
    } else {
      //pm case
      if (closeHr == "12") {
        timeClose =
            TimeOfDay(hour: int.parse(closeHr), minute: int.parse(closeMin));
      } else {

        timeClose = TimeOfDay(
            hour: int.parse(closeHr) + 12, minute: int.parse(closeMin));
        print('close_time==${timeClose.toString()}');
      }
    }

    int nowInMinutes = timeNow.hour * 60 + timeNow.minute;
    int openTimeInMinutes = timeOpen.hour * 60 + timeOpen.minute;
    int closeTimeInMinutes = timeClose.hour * 60 + timeClose.minute;

//handling day change ie pm to am
    if ((closeTimeInMinutes - openTimeInMinutes) < 0) {
      closeTimeInMinutes = closeTimeInMinutes + 1440;
      if (nowInMinutes >= 0 && nowInMinutes < openTimeInMinutes) {
        nowInMinutes = nowInMinutes + 1440;
      }
      if (openTimeInMinutes < nowInMinutes &&
          nowInMinutes < closeTimeInMinutes) {
        return true;
      }
    } else if (openTimeInMinutes < nowInMinutes &&
        nowInMinutes < closeTimeInMinutes) {
      return true;
    }

    return false;

  }


 static bool checkStoreResProductAvailability(StoreResTimeTable? val){
    if(val!=null){
      String _toady=AppDateTimeFormatService.getTodayDay();


      if(_toady.toLowerCase()==ApiCheckingStings.monday){
        if(val.mondayStartTime!=null&&val.mondayCloseTime!=null){
          bool isOpen=_checkRestaurantStatus(val.mondayStartTime!, val.mondayCloseTime!);
          return isOpen;
        }else{
          return false;
        }

      }else if(_toady.toLowerCase()==ApiCheckingStings.tuesday){
        if(val.tuesdayStarTime!=null&&val.tuesdayCloseTime!=null){
          bool isOpen=_checkRestaurantStatus(val.tuesdayStarTime!, val.tuesdayCloseTime!);
          return isOpen;
        }else{
          return false;
        }

      }else if(_toady.toLowerCase()==ApiCheckingStings.wednesday){
        if(val.wednesdayStartTime!=null&&val.wednesdayCloseTime!=null){
          bool isOpen=_checkRestaurantStatus(val.wednesdayStartTime!, val.wednesdayCloseTime!);
          return isOpen;
        }else{
          return false;
        }
      }else if(_toady.toLowerCase()==ApiCheckingStings.thursday){
        if(val.thursdayStartTime!=null&&val.thursdayCloseTime!=null){
          bool isOpen=_checkRestaurantStatus(val.thursdayStartTime!, val.thursdayCloseTime!);
          return isOpen;
        }else{
          return false;
        }
      }else if(_toady.toLowerCase()==ApiCheckingStings.friday){
        if(val.fridayStartTime!=null&&val.fridayCloseTime!=null){
          bool isOpen=_checkRestaurantStatus(val.fridayStartTime!, val.fridayCloseTime!);
          return isOpen;
        }else{
          return false;
        }
      }else if(_toady.toLowerCase()==ApiCheckingStings.saturday){
        if(val.saturdayStartTime!=null&&val.saturdayCloseTime!=null){
          bool isOpen=_checkRestaurantStatus(val.saturdayStartTime!, val.saturdayCloseTime!);
          return isOpen;
        }else{
          return false;
        }
      }else if(_toady.toLowerCase()==ApiCheckingStings.sunday){

        if(val.sundayStartTime!=null&&val.sundayCloseTime!=null){
          bool isOpen=_checkRestaurantStatus(val.sundayStartTime!, val.sundayCloseTime!);
          return isOpen;
        }else{
          return false;
        }
      }else{
        return false;
      }
    }else{
      return true;
    }




  }
}