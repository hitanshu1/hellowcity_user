import 'package:get/get.dart';
import 'package:hellowcity/app/model/address_model.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/geolocation_service.dart';
import 'package:hellowcity/app/services/permission_service.dart';
import 'package:hellowcity/app/services/pref_service.dart';
import 'package:location/location.dart';

class AllowLocationPermissionController extends GetxController {
  bool isLoading=false;
  LocationData? myLocation;
  late Location location = new Location();
  @override
  void onInit() {
    super.onInit();
  }

  void allowLocationPermission()async{
    isLoading=true;
    update();
    bool isAllow=await AppPermission.allowLocation();

    if(isAllow){
      print('allow');
      // myLocation = await location.getLocation();
      // AddressModel? _address=await GeoLocationService.getAddressFromLatLog(myLocation?.latitude, myLocation?.longitude);
      // print(_address?.toJson());
      // if(_address!=null){
      //   Prefs.setUserLocation(_address);
      // }
      isLoading=false;
      update();
      AppGetService.navigateAndOff(Routes.ENTER_LOCATION);
    }else{
      isLoading=false;
      update();
      AppGetService.navigateAndOff(Routes.ENTER_LOCATION);
    }
    isLoading=false;
    update();

  }
}
