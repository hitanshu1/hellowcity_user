import 'package:get/get.dart';
import 'package:hellowcity/app/model/api/add_to_cart_credentials.dart';
import 'package:hellowcity/app/model/api/add_wish_list_credentials.dart';
import 'package:hellowcity/app/model/api/get_customer_res_item_credentials.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/product_rating.dart';
import 'package:hellowcity/app/model/product_review.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/restaurant_provider.dart';
import 'package:hellowcity/app/providers/user_provider.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';

class ResCustomerItemDetailsController extends GetxController {
  //TODO: Implement ResCustomerItemDetailsController
  ProductItemModel? foodItem;
  int quantity=1;
  bool isLoading=false;
  List<ProductReview>reviews=[];

  HomeController homeController=Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
  }
  void initializeData(ProductItemModel val)async{
    isLoading=true;
    update();
    foodItem=await RestaurantProvider().getCustomerFoodItemDetails(GetCustomerResItemCredentials(
        itemId: val.id.toString(),
        userId: homeController.userDetails?.id?.toString(),
        storeResId: val.storeResId,
        pinCode: homeController.userAddress?.pinCode??''
    ));
    reviews=await RestaurantProvider().getProductReviewList(val.id?.toString()??'');

    isLoading=false;
    update();
  }

  void inCreaseQuantity(){
    quantity++;
    update();
  }
  void decreaseQuantity(){
    if(quantity>1){
      quantity--;
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }
  void addToWishList()async{
    isLoading=true;
    update();
    if(homeController.userDetails?.id!=null){
      ApiResponseModel response=await UserProvider().addOrRemoveToWishList(
        AddWishListCredentials(
            productItemId:foodItem?.id?.toString()??'' , storeResId: foodItem?.storeResId??'',
            userID:homeController.userDetails?.id?.toString()??''),);
      if(response.status==1){
        AppGetService.successSnackbar(response.message??'');
        foodItem?.isWishList=true;
        update();
      }else if(response.status==2){
        AppGetService.successSnackbar(response.message??'');
        foodItem?.isWishList=false;
        update();
      }else{
        AppGetService.errorSnackbar(response.message??'');
      }
    }else{
      AppGetService.navigateTo(Routes.LOGIN_SCREEN);
    }

    isLoading=false;
    update();
  }

  void addToCart()async{
    isLoading=true;
    update();
    if(homeController.userDetails?.id!=null){
      ApiResponseModel response=await UserProvider().addToCart(
        AddToCartCredentials(
            quantity: quantity.toString(),
            productItemId:foodItem?.id?.toString()??'' , storeResId: foodItem?.storeResId??'',
            userID:homeController.userDetails?.id?.toString()??''),);
      if(response.status==1){
        foodItem?.isCart=true;
        update();
        AppGetService.successSnackbar(response.message??'');

      }else{
        AppGetService.errorSnackbar(response.message??'');
      }
    }else{
      AppGetService.navigateTo(Routes.LOGIN_SCREEN);
    }

    isLoading=false;
    update();
  }

  void onSubmitRating(double val)async{
    isLoading=true;
    update();
    ApiResponseModel response=await UserProvider().rateProduct(
        ProductRating(
          productId: foodItem?.id.toString(),
          rating: val,
          ratedBy: homeController.userDetails?.id.toString(),
        ));
    isLoading=false;
    update();
    AppGetService.back();
    if(response.status==1){
      AppGetService.successSnackbar(response.message??'');
      initializeData(foodItem!);
    }else{
      AppGetService.errorSnackbar(response.message??'');
    }
  }

  void getReviewList()async{
    isLoading=true;
    update();
    reviews=await RestaurantProvider().getProductReviewList(foodItem?.id?.toString()??'');
    isLoading=false;
    update();
  }
}
