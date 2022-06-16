import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

import '../controllers/allow_location_permission_controller.dart';

class AllowLocationPermissionView
    extends GetView<AllowLocationPermissionController> {



  Widget _rowPermissionData({required IconData icon,required String text}){

    return Padding(
      padding:SizeConfig.innerSidePadding,
      child: Row(
        children: [
          Icon(icon,color: AppColors.primaryColor,),
          SizeConfig.horizontalSpaceMedium(),
          Expanded(child: Text(text,style: AppStyles.smallTextStyle,))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.sizeConfigInit(context);
    return GetBuilder<AllowLocationPermissionController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              body: Padding(
                padding: SizeConfig.sidePadding,
                child: ListView(
                  children: [
                    SizeConfig.verticalSpace(SizeConfig.screenHeight*.05),
                    Center(
                      child: ViewAppImage(
                        assetsUrl: AppAssets.logo,
                        height: SizeConfig.screenHeight*.15,
                        width: SizeConfig.screenHeight*.15,

                      ),
                    ),
                    Text('Please allow us to provide you following features',
                    style: AppStyles.largeTextStyle.copyWith(
                      color: AppColors.primaryColor,fontWeight: FontWeight.bold
                    ),textAlign: TextAlign.center,),
                    SizeConfig.verticalSpace(SizeConfig.screenHeight*.1),
                    _rowPermissionData(icon: Icons.gps_fixed, text: 'To show nearest store/Restaurant/service list we need your location'),
                    SizeConfig.verticalSpaceSmall(),
                    _rowPermissionData(icon: Icons.photo,
                        text: 'Upload/change your profile pic from gallery we need your storage permission'),
                    SizeConfig.verticalSpaceSmall(),
                    _rowPermissionData(icon: Icons.camera_alt,
                        text: 'Take your profile pic from Camera and to scan store/restaurant barcode we need your Camera permission'),

                    SizeConfig.verticalSpaceExtraLarge(),

                    Text('You can change this option later in the Settings app.',
                    style: AppStyles.mediumTextStyle,),

                    SizeConfig.verticalSpaceExtraLarge(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // TextButton(onPressed: (){
                        //   AppGetService.navigateTo(Routes.ENTER_LOCATION);
                        //
                        // }, child: Text('SKIP',
                        //   style: AppStyles.mediumTextStyle.copyWith(
                        //       color: AppColors.primaryColor,fontWeight: FontWeight.w600
                        //   ),)),
                        // TextButton(onPressed: (){
                        //   gxValues.allowLocationPermission();
                        //
                        // }, child: Text('NEXT',
                        //   style: AppStyles.mediumTextStyle.copyWith(
                        //       color: AppColors.primaryColor,fontWeight: FontWeight.w600
                        //   ),))
                        Expanded(
                          child: CustomButtonWidget(onPressed: (){
                            AppGetService.navigateTo(Routes.ENTER_LOCATION);
                          },buttonText: 'SKIP',
                          gradient: AppColors.grayLinearGradient,),
                        ),
                        SizeConfig.horizontalSpaceMedium(),
                        Expanded(
                          child: CustomButtonWidget(onPressed: (){
                            gxValues.allowLocationPermission();
                          },buttonText: 'NEXT',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
