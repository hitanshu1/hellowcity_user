import 'package:get/get.dart';
import 'package:hellowcity/app/model/store_restaurant_order_model.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/user_provider.dart';

class ActiveCabinController extends GetxController {
  //TODO: Implement ActiveCabinController

  List<StoreRestaurantOrderModel>activeCabinOrder=[];
  bool isLoading=false;
  HomeController homeController=Get.put(HomeController());


  @override
  void onInit() {
    super.onInit();
    getActiveCabinOrder();
  }

  void getActiveCabinOrder()async {
    isLoading=true;
    update();
    activeCabinOrder=await UserProvider().getUserActiveCabinOrders(homeController.userDetails?.id?.toString()??'');

    if(activeCabinOrder.length>1){
      activeCabinOrder.sort((a,b)=>b.id!.compareTo(a.id!));
      update();
    }
    isLoading=false;
    update();

  }

}
