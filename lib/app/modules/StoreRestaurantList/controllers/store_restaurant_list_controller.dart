import 'package:get/get.dart';
import 'package:hellowcity/app/model/api/get_store_res_credentials.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/restaurant_provider.dart';

class StoreRestaurantListController extends GetxController {
  //TODO: Implement StoreRestaurantListController

  List<StoreRestaurantModel>restaurantList=[];
  bool isLoading=true;

  HomeController homeController=Get.put(HomeController());



  void onFetchStoreRestaurantApi(String type)async{
    isLoading=true;
    restaurantList =await RestaurantProvider().getStoreRestaurantListByPinCode(
        GetStoreResCredentials(type: type,pinCode: homeController.userAddress?.pinCode)
    );
    isLoading=false;
    update();
  }
}
