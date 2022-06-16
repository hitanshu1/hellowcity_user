import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';

import '../controllers/about_us_controller.dart';

class AboutUsView extends GetView<AboutUsController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(AppString.aboutUs.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: SizeConfig.sidePadding,
        child: Column(
          children: [
            SizeConfig.verticalSpaceMedium(),
            Expanded(
              child: Text('HellowCity is a Shopping,service and management system app where you can add store/restaurant/service and other user can check and view/order.'
                  'It is basically local for store/restaurant/service so that any one can search them online. ',
                style: AppStyles.smallTextStyle.copyWith(
                    fontWeight: FontWeight.w500

                ),textAlign: TextAlign.center,),
            ),
            Text(AppString.copyrightTile.tr,
              style: AppStyles.smallerTextStyle.copyWith(
                  color: AppColors.darkGrayColor
              ),),
            SizeConfig.verticalSpaceMedium(),
          ],
        ),
      ),
    );
  }
}
