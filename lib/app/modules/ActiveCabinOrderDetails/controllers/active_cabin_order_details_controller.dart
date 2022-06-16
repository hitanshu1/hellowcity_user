import 'package:get/get.dart';
import 'package:hellowcity/app/model/api/add_order_item_credentials.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/store_restaurant_order_model.dart';
import 'package:hellowcity/app/modules/ActiveCabin/controllers/active_cabin_controller.dart';
import 'package:hellowcity/app/modules/SearchProductItem/controllers/search_product_item_controller.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/restaurant_provider.dart';

class ActiveCabinOrderDetailsController extends GetxController {
  bool isLoading=false;
  bool isListLoading=false;
  HomeController homeController=Get.put(HomeController());
  SearchProductItemController searchProductItemController=Get.put(SearchProductItemController());

  ActiveCabinController activeCabinController=Get.put(ActiveCabinController());
  int quantity=1;

  List<ProductItemModel>orderItemList=[];
  StoreRestaurantOrderModel? orderDetails;
  ProductItemModel? selectedFoodItem;
  String? pathImage;
  bool newOrder=false;
  void initializeData(StoreRestaurantOrderModel val){
    isLoading=true;
    orderDetails=val;
    update();

    // cabin=val;
    // restaurantDashboardController.refreshCabin(cabin.cabin!);
    // if(cabin.cabin?.status?.toLowerCase()==ApiCheckingStings.ongoing.toLowerCase()){
    //   newOrder=false;
    // }else{
    //   newOrder=true;
    // }
    update();
    orderItemList=val.productItemList??[];
    orderItemList.sort((a,b)=>b.createdAt.toString().compareTo(a.createdAt.toString()));
    isLoading=false;
    update();
  }


  void onSelectFoodItem()async{
    selectedFoodItem=searchProductItemController.selectedFoodItem;
    ApiResponseModel response=await RestaurantProvider().addItemToResOwnOrder(
        AddOrderItemCredentials(
            resDhabaId: orderDetails?.storeRestaurant?.id?.toString(),
            foodItemID: selectedFoodItem?.id.toString(),
            orderID: orderDetails?.id.toString(),
            price: selectedFoodItem?.price,
            createdBy: homeController.userDetails?.id.toString(),
            quantity: selectedFoodItem?.quantity.toString(),
            name: selectedFoodItem?.name,
            resDhabaName: orderDetails?.storeRestaurant?.name??'',
            cabinName: orderDetails?.cabin?.name
        )
    );
    print(response.toJson());
    if(response.status==1){
      getResOrderItemList();
      activeCabinController.getActiveCabinOrder();

    }

    update();
  }


  void getResOrderItemList() async{
    isListLoading=true;
    update();
    print('calling1');
    if(orderDetails?.id!=null){

      print('calling');

      orderItemList=await RestaurantProvider().getOrderFoodList(orderDetails?.id?.toString()??'');

    }
    isListLoading=false;
    update();
  }

}
