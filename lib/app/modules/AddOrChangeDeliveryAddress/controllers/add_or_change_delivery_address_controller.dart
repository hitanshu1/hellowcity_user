import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/model/address_model.dart';
import 'package:hellowcity/app/model/api/google_address.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/user_provider.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/geolocation_service.dart';
import 'package:hellowcity/app/services/pref_service.dart';


class AddOrChangeDeliveryAddressController extends GetxController {
  //TODO: Implement AddOrChangeDeliveryAddressController
  bool isLoading=false;
  bool showAddressList=true;
  final formKey = GlobalKey<FormState>();
  bool autoValidation=false;
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController address1Controller=TextEditingController();
  TextEditingController address2Controller=TextEditingController();
  TextEditingController landMarkController=TextEditingController();
  TextEditingController pinCodeController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController districtController=TextEditingController();
  TextEditingController stateController=TextEditingController();
  TextEditingController countryController=TextEditingController();
  GoogleAddress? address;
  AddressModel? selectedAddress;
  List<AddressModel>addressList=[];

  HomeController homeController=Get.put(HomeController());
  // OrderCheckOutController orderCheckOutController=Get.put(OrderCheckOutController());
  bool isDefault=false;
  void onChangeDefault(bool val){
    isDefault=val;
    update();
  }
  void onChangeView(bool val){
    showAddressList=val;
    update();
  }
  @override
  void onInit() {
    super.onInit();
    getUserAddressList();
  }

  void clearAll(){
    nameController.clear();
    phoneNumberController.clear();
    address1Controller.clear();
    address2Controller.clear();
    pinCodeController.clear();
    stateController.clear();
    countryController.clear();
    autoValidation=false;
    update();
  }

  void initializeData(AddressModel? val){
    isLoading=true;
    update();
    if(val!=null){
      selectedAddress=val;
      nameController.text=val.name??'';
      phoneNumberController.text=val.phone??'';
      address1Controller.text=val.addressLine1??'';
      address2Controller.text=val.addressLine2??'';
      cityController.text=val.city??'';
      pinCodeController.text=val.pinCode??'';
      stateController.text=val.state??'';
      countryController.text=val.country??'';
      isDefault=val.defaultAddress;
      showAddressList=false;
    }

    isLoading=false;
    update();
  }

  void getUserAddressList()async{
    isLoading=true;
    update();
    addressList=await UserProvider().getUserAddressList(homeController.userDetails?.id?.toString()??'');
    isLoading=false;
    update();

  }

  void getAddressFromPinCode(String val,BuildContext context)async{
    isLoading=true;
    update();
    try{

      address= await GeoLocationService.getAddressFromPinCode(val);
      print(address?.toJson());
      if(address?.city!=null) {
        cityController.text=address?.city??'';
        countryController.text=address?.country??'';
        stateController.text=address?.state??'';

      }
      isLoading=false;

    }catch(e){
      print('error==$e');
      pinCodeController.clear();
      isLoading=false;
      AppGetService.errorSnackbar(AppString.invalidPinCode.tr);

    }
    update();


  }

  void onSubmit()async{
    if (formKey.currentState!.validate()) {
      autoValidation=false;
      update();
      ApiResponseModel response=await UserProvider().addOrUpdateUserAddress(AddressModel(
          id: selectedAddress?.id,
          addressLine1: address1Controller.text,
          addressLine2: address1Controller.text,
          defaultAddress: isDefault,
          state: stateController.text,
          pinCode: pinCodeController.text,
          phone: phoneNumberController.text,
          city: cityController.text,
          country: countryController.text,
          name: nameController.text,
          userID: homeController.userDetails?.id.toString()
      ));

      if(response.status==1){
        nameController.clear();
        phoneNumberController.clear();
        address1Controller.clear();
        address2Controller.clear();
        pinCodeController.clear();
        stateController.clear();
        countryController.clear();
        autoValidation=false;
        showAddressList=true;
        getUserAddressList();


        update();
        homeController.getUserDetails();
        AppGetService.successSnackbar(response.message??'');
      }else{
        AppGetService.errorSnackbar(response.message??'');
      }

    }else{
      autoValidation=true;
      update();
    }
  }

  void onSetAsDefault(AddressModel val)async{
    isLoading=true;
    update();
    ApiResponseModel response=await UserProvider().setUserDefaultAddress(val);
    if(response.status==1){
      Prefs.setUserLocation(val);
      homeController.onInit();

      getUserAddressList();
      update();
      AppGetService.successSnackbar(response.message??'');
    }
    isLoading=false;
    update();
  }


}
