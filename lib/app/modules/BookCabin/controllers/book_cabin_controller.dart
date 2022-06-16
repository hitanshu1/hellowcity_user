import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/booking_model.dart';
import 'package:hellowcity/app/model/cabin_model.dart';
import 'package:hellowcity/app/modules/RestaurantDetails/controllers/restaurant_details_controller.dart';
import 'package:hellowcity/app/modules/SearchCabin/controllers/search_cabin_controller.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/restaurant_provider.dart';
import 'package:hellowcity/app/services/app_date_time_format_service.dart';
import 'package:hellowcity/app/services/app_get_service.dart';

class BookCabinController extends GetxController {
  //TODO: Implement BookCabinController

  RestaurantDetailsController restaurantDetailsController=Get.put(RestaurantDetailsController());
  SearchCabinController searchCabinController=Get.put(SearchCabinController());
  TextEditingController cabinController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController startTimeController=TextEditingController();
  TextEditingController endTimeController=TextEditingController();
  DateTime? selectedDate,selectedStartTime,selectedEndTime;
  HomeController homeController=Get.put(HomeController());
  final formKey = GlobalKey<FormState>();
  bool isLoading=false;
  bool autoValidation=false;

  Cabin ?selectedCabin;
  @override
  void onInit() {
    super.onInit();
  }

 void onSelectCabin(){
    selectedCabin=searchCabinController.selectedCabin;
    cabinController.text=selectedCabin?.name??'';
    update();

 }

 void onSelectDate(DateTime val){
    selectedDate=val;
    dateController.text=AppDateTimeFormatService.getDateMonthYear(val.toIso8601String());
    update();

 }
 void onSelectStartTime(DateTime val){
    selectedStartTime=val;
    startTimeController.text=AppDateTimeFormatService.getTime(val.toIso8601String());
    update();
 }
  void onSelectEndTime(DateTime val){
    if((val.difference(selectedStartTime!))>Duration(hours: 1)){
      selectedEndTime=val;
      endTimeController.text=AppDateTimeFormatService.getTime(val.toIso8601String());
      update();
    }else{
      AppGetService.errorSnackbar(AppString.minimumBookingTimeHour.tr);
    }

  }

  void onSubmit()async{
    if (formKey.currentState!.validate()) {
      isLoading=true;
      autoValidation=false;
      update();
      ApiResponseModel response=await RestaurantProvider().bookRestaurantCabin(BookingModel(
        customerId: homeController.userDetails?.id.toString(),
        startTime: startTimeController.text,
        endTime: endTimeController.text,
        date: dateController.text,
        cabin: selectedCabin,
        resID: restaurantDetailsController.restaurant?.id?.toString(),
      ));
      if(response.status==1){
        AppGetService.back();
        AppGetService.successSnackbar(response.message??'');

      }else{
        AppGetService.errorSnackbar(response.message??'');
      }


      isLoading=false;
      update();
    }else{
      autoValidation=true;
      update();
    }
  }
}
