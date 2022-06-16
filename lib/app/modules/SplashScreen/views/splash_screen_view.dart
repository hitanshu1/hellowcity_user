import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hellowcity/app/data/text_style.dart';
import '../controllers/splash_screen_controller.dart';
class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.sizeConfigInit(context);
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        builder: (gxValues){
          return  Center(
            child: AnimatedTextKit(
              animatedTexts: [
                ScaleAnimatedText('Welcome to HellowCity',
                    textStyle:AppStyles.largeTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor
                    ),duration: Duration(seconds: 3) ),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          );
        },
      ),
    );
  }
}
