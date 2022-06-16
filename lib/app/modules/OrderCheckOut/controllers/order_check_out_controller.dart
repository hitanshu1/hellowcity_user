import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/model/address_model.dart';
import 'package:hellowcity/app/model/api/check_serviceable_pincode_credentials.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/customer_order_model.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/modules/OrderDetails/controllers/order_details_controller.dart';
import 'package:hellowcity/app/modules/UserCart/controllers/user_cart_controller.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/user_provider.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/number_service.dart';

class OrderCheckOutController extends GetxController {
  //TODO: Implement OrderCheckOutController

  bool isLoading=false;

  OrderDetailsController orderDetailsController=Get.put(OrderDetailsController());
  UserCartController userCartController=Get.put(UserCartController());
  HomeController homeController=Get.put(HomeController());
  CustomerOrderModel? orderDetails;
  TextEditingController couponCodeController=TextEditingController();

  AddressModel? defaultAddress;
  List<StoreRestaurantModel>unServiceableStoreResList=[];
  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void initializeData()async{
    isLoading=true;
    update();
    orderDetails=orderDetailsController.orderDetails;
    defaultAddress=await UserProvider().getUserDefaultAddress(homeController.userDetails?.id?.toString()??'');
    if(defaultAddress!=null){
      unServiceableStoreResList=await UserProvider().getStoreResListIfUnserviceable(CheckServiceablePinCodeCredentials(
          useId: homeController.userDetails?.id?.toString()??'',
          pinCode: defaultAddress?.pinCode??'0'
      ));
      isLoading=false;
      update();
    }else{
      isLoading=false;
      update();
    }

  }

  @override
  void onReady() {
    super.onReady();
  }

  void onPlaceOrder()async{
    isLoading=true;
    update();
    print('working');
    orderDetails?.deliveryAddress=defaultAddress;
    orderDetails?.totalAppCharge=NumberService.totalAppCharge(orderDetails!);
    orderDetails?.userId=homeController.userDetails?.id.toString();
    update();
    ApiResponseModel response=await UserProvider().customerPlaceOrder(orderDetails!);
    if(response.status==1){
      isLoading=false;
      update();

      AppGetService.successSnackbar(response.message??'');
      userCartController.clearData();
      Timer(Duration(seconds: 1), (){
        AppGetService.navigateAndOff(Routes.HOME);
      });

    }else{
      isLoading=false;
      update();
      AppGetService.errorSnackbar(response.message??'');
    }
  }
}
