import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/pref_service.dart';
import 'package:hellowcity/app/shared/app_profile_image_widget.dart';

import 'custom_click_option_tile.dart';
class AppDrawerWidget extends StatelessWidget {
   AppDrawerWidget({Key? key}) : super(key: key);

  final HomeController homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppProfileImageWidget(
                    emptyImageUrl: AppAssets.sample_user,
                    imageUrl: homeController.userDetails?.profilePic,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(AppString.copyrightTile,
                      style: AppStyles.smallerTextStyle.copyWith(
                        color: AppColors.darkGrayColor
                      ),)

                    ],
                  ),

                ],
              )),
          SizeConfig.verticalSpaceSmall(),
          CustomClickOptionTile(text: AppString.myOrders.tr,
            onTap: (){
            AppGetService.back();
            if(homeController.userDetails?.id!=null){
              AppGetService.navigateTo(Routes.MY_ORDERS);
            }else{
              AppGetService.navigateTo(Routes.LOGIN_SCREEN,
                  then: (val){
                    homeController.initializeData();
                  });
            }



            },),
          SizeConfig.verticalSpaceSmall(),
          CustomClickOptionTile(text: AppString.myBookings.tr,
            onTap: (){
              AppGetService.back();
              if(homeController.userDetails?.id!=null){
                AppGetService.navigateTo(Routes.MY_BOOKINGS);
              }else{
                AppGetService.navigateTo(Routes.LOGIN_SCREEN,
                    then: (val){
                      homeController.initializeData();
                    });
              }



            },),
          SizeConfig.verticalSpaceSmall(),
          CustomClickOptionTile(text: AppString.activeCabin.tr,
            onTap: (){
              AppGetService.back();
              if(homeController.userDetails?.id!=null){
                AppGetService.navigateTo(Routes.ACTIVE_CABIN);
              }else{
                AppGetService.navigateTo(Routes.LOGIN_SCREEN,
                then: (val){
                  homeController.initializeData();
                });
              }



            },),
          SizeConfig.verticalSpaceSmall(),
          CustomClickOptionTile(text: AppString.aboutUs.tr,
         
            onTap: (){
            AppGetService.navigateTo(Routes.ABOUT_US);

            },),
          SizeConfig.verticalSpaceSmall(),
          CustomClickOptionTile(text: AppString.contactUs.tr,
            onTap: (){
            AppGetService.navigateTo(Routes.CONTACT_US);

            },),
          SizeConfig.verticalSpaceSmall(),

          CustomClickOptionTile(text: AppString.logout.tr,
            onTap: (){
              homeController.clearHome();
              Prefs.logOut();
              AppGetService.back();
            },),
          SizeConfig.verticalSpaceSmall(),
        ],
      ),
    );
  }
}
