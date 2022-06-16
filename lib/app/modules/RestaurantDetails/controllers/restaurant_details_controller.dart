import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/model/offer_model.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/store_res_time_table.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/providers/restaurant_provider.dart';
import 'package:hellowcity/app/services/app_date_service.dart';
import 'package:hellowcity/app/services/search_service.dart';

class RestaurantDetailsController extends GetxController {
  //TODO: Implement RestaurantDetailsController

  bool isLoading=false;
  StoreRestaurantModel? restaurant;
  StoreResTimeTable? storeResTimeTable;
  List<StoreResOfferModel>offerList=[];
  List<ProductItemModel>foodList=[];
  bool enableProducts=false;
  TextEditingController searchItemTextEditingController=TextEditingController();
  List<ProductItemModel>_foodItemList=[];
  List<ProductItemModel>get productList{
    List<ProductItemModel>_list=[];
    for (var element in _foodItemList) {
      if(SearchService.productAvailable(element, searchItemTextEditingController.text)){
        _list.add(element);

      }
    }

    return _list;
  }

  void initializeData(StoreRestaurantModel val)async{
    isLoading=true;
    update();
    restaurant =val;
    storeResTimeTable=await RestaurantProvider().getStoreResTimeTable(val.id?.toString()??'');
    if(storeResTimeTable!=null){
      enableProducts= AppDateService.checkStoreResProductAvailability(storeResTimeTable!);
      update();
    }




    searchItemTextEditingController.clear();
    offerList=await RestaurantProvider().getRestaurantOfferList(val.id?.toString()??'');
    _foodItemList=await RestaurantProvider().getStoreResItemList(val.id?.toString()??'');
    isLoading=false;
    update();
  }

  void onClearSearch(){
   searchItemTextEditingController.clear();
   update();
  }
}
