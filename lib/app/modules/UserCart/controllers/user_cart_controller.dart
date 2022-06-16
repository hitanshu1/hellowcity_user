import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/model/api/add_wish_list_credentials.dart';
import 'package:hellowcity/app/model/api/delete_cart_credentials.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/user_provider.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_date_service.dart';
import 'package:hellowcity/app/services/app_get_service.dart';

class UserCartController extends GetxController {
  //TODO: Implement UserCartController

  bool isLoading=false;
  List<ProductItemModel>productList=[];


  HomeController homeController=Get.put(HomeController());


  void clearData(){
    productList=[];
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCartList();
  }
  void getCartList()async{
    isLoading=true;
    update();
    productList=await UserProvider().getUserCartProductList(
        homeController.userDetails?.id?.toString()??''
    );
    isLoading=false;
    update();
  }

  void deleteCartProduct(ProductItemModel val)async{
    isLoading=true;
    update();
    ApiResponseModel response=await UserProvider().deleteCartItem(
        DeleteCartCredentials(userId: homeController.userDetails?.id?.toString()??'',
            productId: val.id.toString()));
    if(response.status==1){
      productList.remove(val);
      isLoading=false;
      update();
    }else{
      isLoading=false;
      update();
    }

  }
  void deleteAndAddToWishList(ProductItemModel val)async{
    ApiResponseModel response=await UserProvider().addOrRemoveToWishList(
      AddWishListCredentials(
          productItemId:val.id?.toString()??'' , storeResId: val.storeResId??'',
          userID:homeController.userDetails?.id?.toString()??''),);
    if(response.status==1){
      deleteCartProduct(val);
    }
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

  void onClickProceed(){

    bool _allResOpen=productList.any((element) => AppDateService.checkStoreResProductAvailability(element.storeRestaurant?.timeTable));


    if(_allResOpen){
      AppGetService.navigateTo(Routes.ORDER_DETAILS);
    }else{
      AppGetService.errorSnackbar(AppString.cartProductStoreClose.tr);
    }

  }
}
