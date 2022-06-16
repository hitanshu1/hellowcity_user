
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hellowcity/app/services/app_dialog_service.dart';

class AppDatePicker{

  static void selectedDateAndTime({required DateChangedCallback onConFirm}){
    DatePicker.showDateTimePicker(AppDialogService.navigatorKey.currentContext!,
        showTitleActions: true,
        minTime: DateTime.now(),
        currentTime: DateTime.now() ,
        maxTime: DateTime(2050, 6, 7, 05, 09), onChanged: (date) {
          print('change $date in time zone ' +
              date.timeZoneOffset.inHours.toString());
        }, onConfirm: (date) {
         onConFirm(date);
        }, locale: LocaleType.en);
  }
  static void selectedTime({required DateChangedCallback onConFirm}){
    DatePicker.showTime12hPicker(AppDialogService.navigatorKey.currentContext!,
        showTitleActions: true,
        currentTime: DateTime.now() ,
        onConfirm: (date) {
          onConFirm(date);
        }, locale: LocaleType.en);
  }
  static void selectedDate({required DateChangedCallback onConFirm}){
    DatePicker.showDatePicker(AppDialogService.navigatorKey.currentContext!,
        showTitleActions: true,
        minTime: DateTime.now(),
        currentTime: DateTime.now() ,
        maxTime: DateTime(2050, 6, 7, 05, 09), onChanged: (date) {
          print('change $date in time zone ' +
              date.timeZoneOffset.inHours.toString());
        }, onConfirm: (date) {
          onConFirm(date);
        }, locale: LocaleType.en);
  }
}