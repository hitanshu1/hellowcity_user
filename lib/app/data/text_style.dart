
import 'package:flutter/material.dart';
import 'app_font.dart';
import 'app_colors.dart';
import 'size_config.dart';


//Styles are sorted by color
class AppStyles {
  static TextStyle smallerTextStyle=TextStyle(fontSize: SizeConfig.fontSizeVerySmall,color:AppColors.black,
  fontFamily: AppFont.rajdhani);
  static TextStyle smallTextStyle=TextStyle(fontSize: SizeConfig.fontSizeSmall,color:AppColors.black,fontFamily: AppFont.rajdhani);
  static TextStyle mediumTextStyle=TextStyle(fontSize: SizeConfig.fontSizeMedium,color:AppColors.black,fontFamily: AppFont.rajdhani);
  static TextStyle largeTextStyle=TextStyle(fontSize: SizeConfig.fontSizeLarge,color:AppColors.black,fontFamily: AppFont.rajdhani);
  static TextStyle extraLargeTextStyle=TextStyle(fontSize: SizeConfig.fontSizeExtraLarge,color:AppColors.black,fontFamily: AppFont.rajdhani);

}