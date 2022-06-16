import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/providers/restaurant_provider.dart';
import 'package:hellowcity/app/services/app_get_service.dart';

class SearchProductItemController extends GetxController {
  //TODO: Implement SearchProductItemController

  ProductItemModel? selectedFoodItem;
  bool isLoading=false;
  @override
  void onInit() {
    selectedFoodItem=null;
    update();
    super.onInit();
  }

  TextEditingController searchItemTextEditingController=TextEditingController();
  List<ProductItemModel>_foodItemList=[];
  List<ProductItemModel>foodList=[];
  List<ProductItemModel>get productList{
    List<ProductItemModel>_list=[];
    for (var element in _foodItemList) {
      if(element.name!.toLowerCase().contains(searchItemTextEditingController.text.toLowerCase())){
        _list.add(element);

      }
    }

    return _list;
  }
  void initializeData(String resID)async{
    isLoading=true;
    update();
    searchItemTextEditingController.clear();
    _foodItemList=await RestaurantProvider().getStoreResItemList(resID);
    isLoading=false;
    update();
  }

  void onClear(){
    selectedFoodItem=null;
    searchItemTextEditingController.clear();
    update();
  }

  void onSelectedFood(ProductItemModel val){
    selectedFoodItem=val;
    update();
    AppGetService.back();
  }
  void onIncreaseProduct(ProductItemModel val){
    val.quantity++;
    update();
  }
  void onDecreaseProduct(ProductItemModel val){
    if(val.quantity>1){
      val.quantity--;
      update();
    }
  }
}
