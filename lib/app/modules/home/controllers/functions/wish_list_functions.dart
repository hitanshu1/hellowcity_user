import 'package:hellowcity/app/model/api/add_to_cart_credentials.dart';
import 'package:hellowcity/app/model/api/add_wish_list_credentials.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/usermodel.dart';
import 'package:hellowcity/app/providers/user_provider.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
class WishListFunctions{
  final Function update;
  final UserModel? userDetails;
  WishListFunctions({required this.update, this.userDetails});
  bool isLoading=false;
  List<ProductItemModel>wishList=[];

  void getWishList()async{
    isLoading=true;
    update();
    if(userDetails?.id!=null){
      wishList=await UserProvider().getUserWishListProducts(userDetails?.id?.toString()??'');
    }

    isLoading=false;
    update();
  }
  void onClickAddToCart(ProductItemModel val)async{
    isLoading=true;
    update();
    ApiResponseModel response=await UserProvider().addToCart(
      AddToCartCredentials(
          quantity: '1',
          productItemId:val.id?.toString()??'' , storeResId:val.storeResId??'',
          userID:userDetails?.id?.toString()??''),);
    if(response.status==1){
      ApiResponseModel response1=await UserProvider().addOrRemoveToWishList(
        AddWishListCredentials(
            productItemId:val.id?.toString()??'' , storeResId: val.storeResId??'',
            userID:userDetails?.id?.toString()??''),);
       if(response1.status==2){
         AppGetService.successSnackbar(response.message??'');
       getWishList();
        update();
      }else{
        AppGetService.errorSnackbar(response1.message??'');
      }

    }else{
      AppGetService.errorSnackbar(response.message??'');
    }

    isLoading=false;
    update();
  }

  void onDeleteFromWishList(ProductItemModel val)async{
    ApiResponseModel response1=await UserProvider().addOrRemoveToWishList(
      AddWishListCredentials(
          productItemId:val.id?.toString()??'' , storeResId: val.storeResId??'',
          userID:userDetails?.id?.toString()??''),);
    if(response1.status==2){
      AppGetService.successSnackbar(response1.message??'');
      getWishList();
      update();
    }else{
      AppGetService.errorSnackbar(response1.message??'');
    }
  }
}