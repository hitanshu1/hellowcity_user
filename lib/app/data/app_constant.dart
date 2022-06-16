import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
class AppConstants{
  static String faceBookClientID = "2355582358071365";
  static bool darkMode=false;

  static int deliveryCharge=30;
  static int freeDeliveryAmount=300;
  static int hellowCityCharge=30;
  static int gstPercentage=7;

  static Widget circularProgressIndicator(){
    return Center(
      child: SpinKitChasingDots(
        color: AppColors.blueColor,
      ),
    );

  }






}