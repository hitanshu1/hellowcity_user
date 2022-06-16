import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/model/address_model.dart';
import 'package:hellowcity/app/model/cart_item.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/model/usermodel.dart';
import 'package:hellowcity/app/modules/home/controllers/functions/home_widget_functions.dart';
import 'package:hellowcity/app/providers/app_admin_provider.dart';
import 'package:hellowcity/app/providers/user_provider.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_connectivity_service.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/pref_service.dart';

import 'functions/bid_work_functions.dart';
import 'functions/profile_functions.dart';
import 'functions/wish_list_functions.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
//TODO: Implement MainHomeController
  AddressModel? userAddress;
  UserModel? userDetails;
  List<CartItem>cartList=[];
  int index=0;
  bool isLoading=false;
  late BidWorkFunctions bidWorkFunctions;
  late WishListFunctions wishListFunctions;
  late ProfileFunctions profileFunctions;
  late HomeWidgetFunctions homeWidgetFunctions;

  bool updateAvailable=false;
  bool isInterNetAvailable=true;

  @override
  void onInit() {
    homeWidgetFunctions=HomeWidgetFunctions(update: update,userDetails: userDetails);
    wishListFunctions=WishListFunctions(update: update,userDetails: userDetails);

    initializeData();
    super.onInit();
  }

  void clearHome(){
    userDetails=null;
    update();
  }

  void initializeData()async{
    isLoading=true;
    update();
    isInterNetAvailable=await AppConnectivityService.isInterNetAvailable();
    update();
    String? _version=await AppAdminProvider().getAppVersion();
    if(_version!='1.6'){
      updateAvailable=true;
      update();
    }
    userAddress=await Prefs.getUserAddress();
    if(isInterNetAvailable){
      getUserDetails();
    }else{
      isLoading =false;
      update();
    }



  }
  void getUserDetails()async{
    isLoading=true;
    update();
    UserModel? _user=await Prefs.getUserDetails();
    if(_user!=null){
      userDetails=await UserProvider().getUserDetails(_user.id?.toString()??'');
      AddressModel? val=await UserProvider().getUserDefaultAddress(_user.id?.toString()??'');
      if(val!=null){
        userAddress=val;
        update();
      }

    }
    update();
    bidWorkFunctions=BidWorkFunctions(update: update, userDetails: userDetails);
    wishListFunctions=WishListFunctions(update: update, userDetails: userDetails);
    profileFunctions=ProfileFunctions(update: update, userDetails: userDetails);
    homeWidgetFunctions=HomeWidgetFunctions(update: update,userDetails: userDetails);
    homeWidgetFunctions.initializeData();
    isLoading=false;
    update();
  }
  void onQRViewCreated() async{
    print('working');
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // String type = barcodeScanRes.substring( 0, barcodeScanRes.indexOf("_"));
      var parts = barcodeScanRes.split('_');
      String type = parts[0].trim();
      print(type);

      if(type.toLowerCase()==ApiCheckingStings.res){
        String? id = parts.sublist(1).join('_').trim();
        print('id===$id');
        AppGetService.navigateTo(Routes.RESTAURANT_DETAILS,
        argument: StoreRestaurantModel(
          id: int.tryParse(id)
        ));
      }else if(type.toLowerCase()==ApiCheckingStings.store){
        String? id=barcodeScanRes.substring( 1, barcodeScanRes.indexOf("_"));
        // navigationService.navigateTo(StoreDetailsScreen.routeName,
        //     arguments: StoreModel(id:barcodeScanRes));
      }

    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
      AppGetService.errorSnackbar(barcodeScanRes);
    }

  }

  void getUserData(){

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void onChangeIndex(int val){
    index=val;
    if(index==1){
      wishListFunctions.getWishList();
    }

    update();
  }


}
