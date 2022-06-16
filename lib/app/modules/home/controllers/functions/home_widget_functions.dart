
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/model/offer_model.dart';
import 'package:hellowcity/app/model/usermodel.dart';
import 'package:hellowcity/app/providers/restaurant_provider.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';

class HomeWidgetFunctions{
  final Function update;
  final UserModel? userDetails;
  HomeWidgetFunctions({required this.update, this.userDetails});
  bool isLoading=false;
  List<StoreResOfferModel>offerList=[];

  void initializeData()async{
    isLoading=true;
    update();
    offerList=await RestaurantProvider().getAllStoreResOfferList();
    isLoading=false;
    update();
  }

  void onClickCategory(String val){
    if(val==AppString.stores.tr){
      AppGetService.navigateTo(Routes.STORE_RESTAURANT_LIST,argument: ApiCheckingStings.store);
    }else if(val==AppString.restaurantDhaba.tr){
      AppGetService.navigateTo(Routes.STORE_RESTAURANT_LIST,argument: ApiCheckingStings.res);
    }else if(val==AppString.allProducts.tr){
      AppGetService.navigateTo(Routes.ALL_PRODUCTS,);
    }
  }
}
