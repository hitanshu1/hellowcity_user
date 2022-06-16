import 'package:get/get.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/restaurant_provider.dart';
import 'package:hellowcity/app/services/search_service.dart';

class AllProductsController extends GetxController {
  //TODO: Implement AllProductsController

  bool isLoading=false;
  bool showStore=false;
  HomeController homeController=Get.put(HomeController());

  List<ProductItemModel>_allProducts=[];
  List<ProductItemModel>products=[];


  void onChangeTabValue(bool val){
    showStore=val;
    update();
    _getProductList();
  }


  void _getProductList()async{
    isLoading=true;
    products=[];
    update();
    _allProducts=await RestaurantProvider().getStoreResProductByPinCode(homeController.userAddress?.pinCode??'', showStore?ApiCheckingStings.store:ApiCheckingStings.res);
    for(ProductItemModel _product in _allProducts){
      products.add(_product);
    }
    isLoading=false;
    update();

  }


  void onSearchText(String val){
    products=[];
    update();
    for(ProductItemModel _product in _allProducts){
      if(SearchService.productAvailable(_product, val)){
        products.add(_product);
        update();
      }
    }
  }




  @override
  void onInit() {
    super.onInit();
    _getProductList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
