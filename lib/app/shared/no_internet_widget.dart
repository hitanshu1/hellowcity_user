import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';
import 'package:hellowcity/app/data/app_colors.dart';

import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';

class NoInterNetWidget extends StatelessWidget {
  const NoInterNetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

         ViewAppImage(
           assetsUrl: AppAssets.noInternet,
           height: SizeConfig.screenHeight*.2,
           width:  SizeConfig.screenHeight*.2,
         ),
          SizeConfig.verticalSpaceMedium(),
          Text('No Internet connection available',
          style: AppStyles.mediumTextStyle.copyWith(
            fontWeight: FontWeight.w700,color: AppColors.primaryColor
          ),)
        ],
      ),
    );
  }
}
