import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_click_option_tile.dart';
import 'package:hellowcity/app/shared/custom_profile_image_container.dart';


class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (gxValues){
          if(gxValues.userDetails?.id!=null){
          return AppLoadingWidget(
              isLoading: gxValues.profileFunctions.isLoading,
              child: Padding(
                padding: SizeConfig.sidePadding,
                child: ListView(
                  children: [
                    SizeConfig.verticalSpaceSmall(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomProfileImageContainer(
                          imageUrl: gxValues.userDetails?.profilePic,
                          assetUrl: AppAssets.sample_user,
                        ),
                        SizeConfig.horizontalSpaceSmall(),
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(gxValues.userDetails?.name??'',style: AppStyles.largeTextStyle.copyWith(
                                fontWeight: FontWeight.bold
                            ),),
                            SizeConfig.verticalSpaceSmall(),

                            Text(gxValues.userDetails?.phoneNumber??'',style: AppStyles.largeTextStyle.copyWith(
                                color: AppColors.darkGrayColor
                            ),),
                          ],

                        )),
                        IconButton(onPressed: (){
                          AppGetService.navigateTo(Routes.EDIT_PROFILE);

                        }, icon: Icon(Icons.edit,color: AppColors.green,))
                      ],
                    ),
                    SizeConfig.verticalSpaceLarge(),
                    CustomClickOptionTile(text: AppString.myOrders.tr,
                      onTap: (){
                      AppGetService.navigateTo(Routes.MY_ORDERS);
                      },),
                    SizeConfig.verticalSpaceSmall(),
                    CustomClickOptionTile(text: AppString.address,
                      onTap: (){
                      AppGetService.navigateTo(Routes.ADD_OR_CHANGE_DELIVERY_ADDRESS);
                      },),
                    SizeConfig.verticalSpaceSmall(),
                    // CustomClickOptionTile(text: AppString.logout,
                    //   onTap: (){
                    //     Prefs.logOut();
                    //    },),

                  ],
                ),
              ));}else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomProfileImageContainer(
                  assetUrl: AppAssets.sample_user,
                ),
                SizeConfig.verticalSpaceMedium(),
                Text(AppString.noUserFoundPleaseLogin.tr,
                style: AppStyles.largeTextStyle,),
                SizeConfig.verticalSpaceMedium(),
                Center(
                  child: TextButton(onPressed: (){
                    AppGetService.navigateTo(Routes.LOGIN_SCREEN,
                    then: (val){
                      gxValues.initializeData();
                    });
                  }, child: Text(AppString.login.tr,
                    style: AppStyles.largeTextStyle.copyWith(
                        fontWeight: FontWeight.w700,color: AppColors.primaryColor
                    ),)),
                )
              ],
            );
          }
        });
  }
}
