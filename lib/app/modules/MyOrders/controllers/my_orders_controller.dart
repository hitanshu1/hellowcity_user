import 'package:get/get.dart';
import 'package:hellowcity/app/model/store_restaurant_order_model.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/user_provider.dart';

class MyOrdersController extends GetxController {
  //TODO: Implement MyOrdersController
  //TODO: Implement MyOrdersController
  bool isLoading=false;
  List<StoreRestaurantOrderModel>orderList=[];
  HomeController homeController=Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
    getOrderList();

  }
  void getOrderList()async{
    isLoading=true;
    update();
    orderList=await UserProvider().getUserOrderList(homeController.userDetails?.id.toString()??'');
    if(orderList.length>1){
      orderList.sort((a,b)=>b.id!.compareTo(a.id!));
    }

    isLoading=false;
    update();
  }
}
