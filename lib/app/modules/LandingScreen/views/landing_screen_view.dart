import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/modules/LandingScreen/widget/landing_last_step_widget.dart';
import 'package:hellowcity/app/modules/LandingScreen/widget/landing_step_widget.dart';
import '../controllers/landing_screen_controller.dart';

class LandingScreenView extends GetView<LandingScreenController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.sizeConfigInit(context);
    return Scaffold(
        body: GetBuilder<LandingScreenController>(
          builder: (gxValues){
            if(gxValues.step==2){
              return   LandingLastStepWidget();
            }
            return LandingStepWidget();
          },
        )
    );
  }
}
