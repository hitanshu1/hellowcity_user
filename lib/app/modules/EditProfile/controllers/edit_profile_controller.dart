import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/user_provider.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/app_image_picker_service.dart';

import '../../../model/api/user_credentials.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController
  bool isLoading=false;

  File ? imageFile;
  TextEditingController nameController=TextEditingController();
  HomeController homeController=Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  void _initializeData(){
    nameController.text=homeController.userDetails?.name??'';
    update();
  }


  void onPickImage(BuildContext context){
    AppImagePickerService.optionsPhoto(context: context,
        onSelectCameraImage: (val){
      imageFile=val;
      update();
        }, onSelectGalleryImage: (val){
          imageFile=val;
          update();
        });
  }

  void onUpdateProfile()async{
    isLoading=true;
    update();
    ApiResponseModel response=await UserProvider().updateUserDetails(UserCredentials(
        name: nameController.text,
        profilePicFile: imageFile,
        id: homeController.userDetails?.id?.toString()
    ));
    if(response.status==1){
      AppGetService.successSnackbar(response.message??'');
      homeController.getUserDetails();
    }else{
      AppGetService.errorSnackbar(response.message??'');
    }
    isLoading=false;
    update();
  }
}
