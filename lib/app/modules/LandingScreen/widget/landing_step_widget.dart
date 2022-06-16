import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/hellow_city_icon.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/LandingScreen/controllers/landing_screen_controller.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/custom_card.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

import 'package:hellowcity/app/services/pref_service.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class LandingStepWidget extends StatelessWidget {
  LandingStepWidget({Key? key}) : super(key: key);

  final landingController= Get.put(LandingScreenController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppAssets.splashBackground),fit: BoxFit.cover)
          ),
        ),
        Positioned(child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: SizeConfig.sidePadding.copyWith(
                top: SizeConfig.screenHeight*.2
            ),
            child: CustomCard(
              color: AppColors.whiteColor.withOpacity(.7),
              child: Padding(
                padding: SizeConfig.padding,
                child: Container(
                  height:SizeConfig.screenHeight*.5 ,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizeConfig.verticalSpaceSmall(),
                      ViewAppImage(
                        assetsUrl: landingController.assetString,
                        height: SizeConfig.screenHeight*.3,
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      Text(landingController.title,style: AppStyles.mediumTextStyle.copyWith(
                          color: AppColors.primaryColor,fontWeight: FontWeight.bold
                      ),textAlign: TextAlign.center,),
                      SizeConfig.verticalSpaceMedium(),
                      Text(landingController.subTitle,style: AppStyles.smallerTextStyle.copyWith(
                        color: AppColors.darkGrayColor,
                      ),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
        Positioned(bottom: MediaQuery.of(context).size.height*0.06,child: Padding(
          padding:EdgeInsets.only(
              left:  MediaQuery.of(context).size.width*0.1,
    right:  MediaQuery.of(context).size.width*0.1),
          child: Row(
            children: <Widget>[
              InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.09,
                  width: MediaQuery.of(context).size.width*0.37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: SizeConfig.appShadow,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularPercentIndicator(
                        radius: 20.0,
                        lineWidth: 1.0,
                        percent: landingController.percentage,
                        center: Icon(HellowCityIcons.right_open_big),
                        progressColor: Colors.blue,
                      ),
                     SizeConfig.horizontalSpaceSmall(),
                      Text(AppString.next.tr,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,fontWeight: FontWeight.bold),)
                    ],
                  ),

                ),
                onTap: (){
                  landingController.onChangeStep();

                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
              ),
              InkWell(child: Text(AppString.skip,style: AppStyles.smallTextStyle.copyWith(
                fontWeight: FontWeight.w600
              ),),
                onTap: (){
                  Prefs.setFirstTime();
                  AppGetService.navigateAndOff(Routes.ALLOW_LOCATION_PERMISSION);
                },)

            ],
          ),
        ))
      ],
    );
  }
}
