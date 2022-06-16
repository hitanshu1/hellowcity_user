import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/shared/app_title_tile_widget.dart';

import '../controllers/contact_us_controller.dart';
class ContactUsView extends GetView<ContactUsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.contactUs.tr),
        centerTitle: true,
      ),
      body:Padding(
        padding: SizeConfig.sidePadding,
        child: ListView(
          children: [
            SizeConfig.verticalSpaceMedium(),
            AppTitleTileWidget(
              firstText: AppString.email.tr,
              secondText: 'support@hellowcity.com',
            ),
            AppTitleTileWidget(
              firstText: AppString.phone.tr,
              secondText: '9707301550/7002780550',
            ),
          ],
        ),
      ),
    );
  }
}