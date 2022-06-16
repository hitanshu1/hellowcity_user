import 'package:get/get.dart';
import 'package:hellowcity/app/model/address_model.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/pref_service.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController


  @override
  void onInit() {
    initializeData();
    update();
    super.onInit();

  }
  void initializeData()async{
    Future.delayed(Duration(seconds: 3),() async{

      bool isFirstTime=await Prefs.getFirstTime();
      if(isFirstTime){
        AppGetService.navigateAndOff(Routes.LANDING_SCREEN);
      }else{
        AddressModel _address=await Prefs.getUserAddress();
        if(_address.pinCode!=null){
          AppGetService.navigateAndOff(Routes.HOME);
        }else{
          AppGetService.navigateAndOff(Routes.ALLOW_LOCATION_PERMISSION);
        }
      }

    });


  }
}
