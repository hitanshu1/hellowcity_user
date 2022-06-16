import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/model/address_model.dart';
import 'package:hellowcity/app/model/api/google_address.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/geolocation_service.dart';
import 'package:hellowcity/app/services/pref_service.dart';

class EnterLocationController extends GetxController {

  TextEditingController pinCodeController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController yourNameController=TextEditingController();
  FocusNode pinCodeNode=FocusNode();
  FocusNode cityFocusNode=FocusNode();
  FocusNode nameFocusNode=FocusNode();
  GoogleAddress? address;
  bool isLoading=false;
  // AuthBase auth = getIt<Auth>();


  void initializeData()async{
    isLoading=true;
    update();
    AddressModel? _address=await Prefs.getUserAddress();
    if(_address.pinCode!=null){
      address=GoogleAddress(
          state: _address.state,
          addressLine: _address.addressLine1,
          city: _address.city,
          pinCode: _address.pinCode
      );
    }
    pinCodeController.text=_address.pinCode??'';
    cityController.text=_address.city??'';
    yourNameController.text=_address.name??'';
    isLoading=false;
    update();
  }
  @override
  void onInit() {
    initializeData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void getAddressFromPinCode(String val,BuildContext context)async{
    isLoading=true;
    update();
    try{

      address= await GeoLocationService.getAddressFromPinCode(val);
      print(address?.toJson());
      if(address?.city!=null) {
        cityController.text=address?.city??'';
      }
      isLoading=false;

    }catch(e){
      pinCodeController.clear();
      isLoading=false;
      AppGetService.errorSnackbar(AppString.invalidPinCode.tr);
    }
    update();


  }
  void onProceed()async{
    isLoading=true;
    update();
    if(yourNameController.text.isEmpty){
      isLoading=false;
      AppGetService.errorSnackbar(AppString.pleaseEnterYourName);
      return;
    }
    if(cityController.text.isEmpty){
      isLoading=false;
      AppGetService.errorSnackbar(AppString.pleaseEnterYourCity);

      return ;
    }
    if(pinCodeController.text.isEmpty){
      isLoading=false;
      AppGetService.errorSnackbar(AppString.pleaseEnterPinCode);
      return ;
    }
    if(address!=null){

      Prefs.setUserLocation(AddressModel(city: cityController.text,
          name: yourNameController.text,pinCode: pinCodeController.text));
      isLoading=false;
      AppGetService.navigateAndOff(Routes.HOME);
    }else{
      AppGetService.errorSnackbar(AppString.invalidPinCode);
    }
    isLoading=false;
    update();
  }
}
