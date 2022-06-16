import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
class AppGetService{

  static void navigateTo(String routeName,{Object? argument,Function? then}){
    Get.toNamed(routeName,arguments: argument)?.then((value){
      if(then!=null)
      then(value);
    });
  }
  static void navigateAndOff(String routeName,{Object? argument}){
    Get.offAndToNamed(routeName,arguments: argument);
  }
  static void back(){
    Get.back();
  }

  static void successSnackbar(String message){
    Get.snackbar("", "",
        titleText: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizeConfig.verticalSpaceMedium(),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.check,color: AppColors.primaryColor,),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(message,style: AppStyles.smallTextStyle.copyWith(
                      color: AppColors.primaryColor,fontWeight: FontWeight.w700,
                    ),textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ],
          ),
        ),
        padding: EdgeInsets.all(0),
        backgroundColor: Colors.white);
  }
  static void errorSnackbar(String message){
    Get.snackbar("", "",
        titleText: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizeConfig.verticalSpaceMedium(),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.error,color: AppColors.red,),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(message,style: AppStyles.smallTextStyle.copyWith(
                      color: AppColors.primaryColor,fontWeight: FontWeight.w700,
                    ),textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ],
          ),
        ),
        padding: EdgeInsets.all(0),
        backgroundColor: Colors.white);
  }
}