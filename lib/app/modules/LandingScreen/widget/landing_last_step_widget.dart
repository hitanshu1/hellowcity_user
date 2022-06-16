import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/custom_card.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';
import 'package:hellowcity/app/services/pref_service.dart';

class LandingLastStepWidget extends StatelessWidget {
  const LandingLastStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
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
                        assetsUrl: AppAssets.welcome,
                        height: SizeConfig.screenHeight*.3,
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      Text(AppString.welcomeTitle.tr,style: AppStyles.mediumTextStyle.copyWith(
                          color: AppColors.primaryColor,fontWeight: FontWeight.bold
                      ),textAlign: TextAlign.center),
                      SizeConfig.verticalSpaceMedium(),
                      Text(AppString.welcomeSubTitle.tr,style: AppStyles.smallerTextStyle.copyWith(
                        color: AppColors.darkGrayColor,
                      ),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
        Positioned(bottom: 0,right: 0,left: 0,child:Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Container(
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.6),
                    boxShadow: SizeConfig.appShadow,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                    border: Border.all(color: Colors.transparent)
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(bottom: 0,right: 0,left: 0,child: Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.03,right: MediaQuery.of(context).size.height*0.03),
                      child: InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.07,
                          child: Center(
                            child: Text(AppString.getStart.tr,style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.024,fontWeight: FontWeight.bold),),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(62, 68, 93, 1),
                              borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        onTap: (){
                          Prefs.setFirstTime();
                          AppGetService.navigateAndOff(Routes.ALLOW_LOCATION_PERMISSION);
                        },
                      ),))
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.6),
                  border: Border.all(color: Colors.transparent)

              ),
            )
          ],
        ))
      ],
    );
  }
}
