import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/model/cabin_model.dart';
import 'package:hellowcity/app/modules/RestaurantDetails/controllers/restaurant_details_controller.dart';
import 'package:hellowcity/app/providers/restaurant_provider.dart';
import 'package:hellowcity/app/services/app_get_service.dart';

class SearchCabinController extends GetxController {
  //TODO: Implement SearchCabinController

  bool isLoading=false;

  List<Cabin>_cabinList=[];
  Cabin ? selectedCabin;
  RestaurantDetailsController restaurantDetailsController=Get.put(RestaurantDetailsController());

  TextEditingController searchCabinController=TextEditingController();
  List<Cabin>get cabinList{
    List<Cabin>_list=[];
    for (var element in _cabinList) {
      if(element.name!.toLowerCase().contains(searchCabinController.text.toLowerCase())){
        _list.add(element);

      }
    }

    return _list;
  }
  @override
  void onInit() {
    selectedCabin=null;
    update();
    getCabinList();
    super.onInit();
  }

  void getCabinList()async{
    isLoading=true;
    update();
    List<Cabin>values=await RestaurantProvider().getCabinAndTableList(restaurantDetailsController.restaurant?.id?.toString()??'');
    update();
    for(var val in values){
      if(val.type?.toLowerCase()==ApiCheckingStings.cabin){
        _cabinList.add(val);
        update();
      }
    }
    isLoading=false;
    update();

  }
  void onSelectCabin(Cabin val){
    selectedCabin=val;
    update();
    AppGetService.back();
  }
}
