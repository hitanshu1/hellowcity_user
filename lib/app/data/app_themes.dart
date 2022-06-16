
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_font.dart';

class AppThemes{

  static ThemeData light=ThemeData(

    fontFamily: AppFont.montserrat,
    backgroundColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        brightness: Brightness.light,backgroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold,
      fontSize: 20,fontFamily: AppFont.rajdhani)
    ),
    textTheme: TextTheme(
        // body1: TextStyle(
        // fontSize:11, color: AppColors.blackFontColor)
    ),
    primaryColor: AppColors.primaryColor,
    selectedRowColor: AppColors.grayBackgroundColor.withOpacity(1),
    accentColor: AppColors.primaryColor,
    focusColor: AppColors.black,
    splashColor: AppColors.primaryColor.withOpacity(.15),
    highlightColor: Colors.transparent,
    primaryColorLight: AppColors.lightGreyColor,
    colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
    buttonColor: AppColors.whiteColor,
    primarySwatch: Colors.green,

    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.primaryColor,
    ),

  );
  static ThemeData dark= ThemeData(
    fontFamily: 'SFUIText',
    backgroundColor:AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.black),
      brightness: Brightness.light,backgroundColor: AppColors.whiteColor,
        titleTextStyle: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold,
        fontSize: 20)
    ),
    bottomAppBarColor: Color(0x121212).withOpacity(1),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0x121212).withOpacity(1)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black
    ),
    buttonColor: AppColors.black,
    textTheme: TextTheme(
        // body1: TextStyle(
        // fontSize: 11, color: AppColors.whiteColor)
    ),
    focusColor: AppColors.whiteColor,

    primaryColor: AppColors.primaryColor,
    selectedRowColor:Colors.grey[700] ,
    cardColor: Colors.grey[900],
    accentColor: AppColors.primaryColor,
    splashColor: AppColors.primaryColor.withOpacity(.15),

    highlightColor: Colors.transparent,
    colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
    primaryColorLight: Colors.grey[900],
    primarySwatch: Colors.green,
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.primaryColor,
    ),

  );
}