import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/custom_text_button.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';

import '../../../data/app_assets.dart';
import '../../../shared/app_loading_widget.dart';
import '../../../shared/custom_profile_image_container.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {


  final HomeController homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.editProfile.tr),
                centerTitle: true,
              ),
              body: Padding(
                padding: SizeConfig.padding,
                child: ListView(
                  children: [
                    SizeConfig.verticalSpaceMedium(),
                    Center(
                      child: CustomProfileImageContainer(
                        size: SizeConfig.screenHeight*.2,
                        imageUrl: homeController.userDetails?.profilePic,
                        assetUrl: AppAssets.sample_user,
                        imageFile: gxValues.imageFile,

                      ),
                    ),
                    SizeConfig.verticalSpaceSmall(),
                    CustomTextButton(
                      text: AppString.changeProfilePic.tr,
                      onPressed: (){
                        gxValues.onPickImage(context);
                      },
                    ),
                    SizeConfig.verticalSpaceMedium(),
                    CustomTextFieldWidget(
                      controller: gxValues.nameController,
                      hintText: AppString.name.tr,
                    ),
                    SizeConfig.verticalSpaceMedium(),

                    CustomButtonWidget(onPressed: (){
                      gxValues.onUpdateProfile();
                    },buttonText: AppString.update.tr,),
                    SizeConfig.verticalSpaceMedium(),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
