
import 'package:flutter/material.dart';

import 'api_checking_strings.dart';


class AppColors{

  static const Color primaryColor = Colors.blue;
  static  Color yellow=Color(0xFFFC00).withOpacity(1);
  static  Color  backgroundColor = Color(0xFFEDEDEB);
  static const Color blueColor = Color(0xFF008aae);
  static const Color facebookButtonColor = Color(0xFF3b5998);
  static const Color highlightColor=Color(0xFF3b5998);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackFontColor = Color(0xFF333333);
  static const Color black = Color(0xFF000000);
  static Color accentColor = Color(0xFFEF019D);
  static const Color lightGreyColor = Color(0xFFDEDEDE);
  static const Color lightGrayDotColor = Color(0xFFD8D8D8);
  static const Color darkGrayColor = Color(0xFF777777);
  static const Color darkGrayLittleColor = Color(0xFF9B9B9B);
  static const Color lightGrayLittleColor = Color(0xFFDDDDDD);
  static const Color grayBackgroundColor=Color(0xF7F7F7);
  static final Color amber=Color(0xFFB892).withOpacity(1);
  static final Color red=Color(0xF81B08).withOpacity(1);
  static final Color veryLightGrayColor=Color(0xF6F6F6).withOpacity(1);
  static final Color activeColor=Color(0x28BE8C).withOpacity(1);

  static Color statusColor(String? val){
    if(val==ApiCheckingStings.pendingForApproval||val==ApiCheckingStings.notApprove){
      return AppColors.red;
    }else if(val==ApiCheckingStings.cancelByUser){
      return AppColors.highlightColor;
    }
    else{
      return AppColors.highlightColor;
    }
  }
  static Color cabinStatusColor(String? val){
    if(val?.toLowerCase()==ApiCheckingStings.ongoing){
      return AppColors.red;
    }else{
      return AppColors.green;
    }
  }


  static const Color greenLigthColorMarkerCircle1=Color.fromRGBO(39, 187, 139, 0.09);
  static const Color greenLigthColorMarkerCircle2= Color.fromRGBO(39, 187, 139, 0.06);
  static const Color greenLigthColorMarkerCircle3= Color.fromRGBO(39, 187, 139, 0.04);

  static const Color green=Color.fromRGBO(39, 187, 139, 1);
  static final loginTopColor=Color(0x909CF2).withOpacity(1);

  static  LinearGradient logInLinearGradient=LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [ 0.0, .5],
    colors: [
      loginTopColor,
      Color(0x19365A).withOpacity(1),
    ],
  );
  static  LinearGradient grayLinearGradient=LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [ 0.0, .5],
    colors: [
      darkGrayLittleColor,
      darkGrayColor,
    ],
  );
  static  LinearGradient redLinearGradient=LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [ 0.0, .5],
    colors: [
      Colors.redAccent.withOpacity(.4),
      Colors.redAccent.withOpacity(.8),
    ],
  );
  static  LinearGradient primaryLinearGradient=LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [ 0.0, .5],
    colors: [
      Colors.blue,
      Colors.lightBlue,
    ],
  );

}




