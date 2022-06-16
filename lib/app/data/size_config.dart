import 'package:flutter/material.dart';

import 'enum/device_type.dart';
import 'enum/mobileSize.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double appBarHeight;

  static late MobileSize mobileSize;
  static late DeviceType deviceType;
  static double mobileSizeScaleFactorVertical = 1.0;
  static double mobileSizeScaleFactorHorizontal = 1.0;

  //font late size
  static late double fontSizeLargeExtraLarge;
  static late double fontSizeMedium;

  static late double fontSizeVerySmall;
  static late double fontSizeSmall;
  static late double fontSizeLarge;
  static late double fontSizeExtraLarge;
  static late double cameraContainerSize;
  static late double fileImageContainerSize;

  //radi lateus
  static late double introGetStartedButtonRadius;
  static late double radiusSmall;
  static late double radiusBig;
  static late double borderRadius=20;

  //icon late size
  static late double iconSize;
  static late double tabIconSize;
  static late double smallIconSize;
  static late double mediumIconSize;
  static late double smallerIconSize;

  //dist lateance from views to screenBorder
  static late double horizontalGap;
  static late double appBarIconSize;
  static late double verticalGap;
  static late double textFieldHeight=55;
  static late double mediumIcon=30;
  static late double largeIcon=40;
  static late double serachAppbarheight=70;
  static late double calculatorHeight;
  static late double smallTileHeight;


  static sizeConfigInit(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    int orgScreenWidth = screenWidth.round();
    int orgScreenHeight = screenHeight.round();
    deviceType=MediaQuery.of(context).size.shortestSide<570?DeviceType.phone:DeviceType.tablet;

    setMobileSize(screenHeight.toInt(), screenWidth.toInt(),context);
    appBarHeight=105;

    fontSizeLargeExtraLarge = 28;
    cameraContainerSize=350;
    fileImageContainerSize=390;

    print('mobile===$mobileSize');

    if(mobileSize==MobileSize.small){
      fontSizeMedium = orgScreenHeight*.022;
      fontSizeSmall = orgScreenHeight*.02;
      fontSizeVerySmall = orgScreenHeight*.013;
      fontSizeLarge = orgScreenHeight*.026;
      fontSizeExtraLarge = orgScreenHeight*.028;
      calculatorHeight=orgScreenHeight*.6;
      smallTileHeight=orgScreenHeight*.2;
    }else if(mobileSize==MobileSize.tablet){
      fontSizeMedium = orgScreenHeight*.022;
      fontSizeSmall = orgScreenHeight*.02;
      fontSizeVerySmall = orgScreenHeight*.013;
      fontSizeLarge = orgScreenHeight*.026;
      fontSizeExtraLarge = orgScreenHeight*.08;
      calculatorHeight=orgScreenHeight*.48;
      smallTileHeight=orgScreenHeight*.2;
    }else{
      fontSizeMedium = orgScreenHeight*.022;
      fontSizeSmall = orgScreenHeight*.02;
      fontSizeVerySmall = orgScreenHeight*.013;
      fontSizeLarge = orgScreenHeight*.026;
      fontSizeExtraLarge = orgScreenHeight*.08;
      calculatorHeight=orgScreenHeight*.48;
      smallTileHeight=orgScreenHeight*.2;
    }


    smallIconSize=15;
    smallerIconSize=12;
    mediumIconSize=25;


    //radius
    introGetStartedButtonRadius = orgScreenHeight * 0.02;
    radiusSmall = orgScreenHeight * 0.01;
    radiusBig = orgScreenHeight * 0.03;
    iconSize = orgScreenWidth * 0.05;
    tabIconSize = orgScreenHeight * 0.03;

    horizontalGap = SizeConfig.screenWidth*.09;
    appBarIconSize = 24;
    verticalGap=SizeConfig.screenHeight*.015;
  }

  // vertical spacing constants. Adjust to your liking.
  static double _verticalSpaceSmall = screenHeight * 0.01;
  static double _verticalSpaceMedium = screenHeight * 0.02;
  static double _verticalSpaceLarge= screenHeight * 0.04;
  static double _verticalSpaceExtraLarge = screenHeight * 0.06;

  // vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double _HorizontalSpaceLarge = 60.0;
  static const double _HorizontalSpaceExtraLarge = 40.0;

  //image height
  static const double smallerImageHeight=45;
  static const double smallImageHeight55=55;
  static const double smallImageHeight60=60;

  static const double smallImageHeight=80;
  static const double orderStatusContainerHeight=235;
  static const double imageHeight90=90;
  static const double smallerImageHeight75=75;
  static const double mediumImageHeight=100;
  static const double BigImageHeight=120;
  static const double BiggerImageHeight=130;
  static const double imageHeight140=140;
  static const double buttonHeight=55;
  static void setMobileSize(int height, int width,BuildContext context){
    if(MediaQuery.of(context).size.shortestSide>570){
      mobileSize = MobileSize.tablet;
    }else{
      if(height<780){
        mobileSize = MobileSize.small;
        mobileSizeScaleFactorVertical = 1.4;
        mobileSizeScaleFactorHorizontal = 0.7;
      }else {
        mobileSize = MobileSize.medium;
        mobileSizeScaleFactorVertical = 1.0;
        mobileSizeScaleFactorHorizontal = 1.0;
      }
    }
  }

  /// Returns a vertical space with height set to [_verticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(_verticalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_verticalSpaceSmallMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(_verticalSpaceMedium);
  }
  static Widget verticalSpaceLarge() {
    return verticalSpace(_verticalSpaceLarge);
  }
  static Widget verticalSpaceExtraLarge() {
    return verticalSpace(_verticalSpaceExtraLarge);
  }
  static Widget verticalSliverSpaceSmall(){
    return SliverToBoxAdapter(
      child: verticalSpaceSmall(),
    );
  }
  static Widget verticalSliverSpaceExtraLarge(){
    return SliverToBoxAdapter(
      child: verticalSpaceExtraLarge(),
    );
  }
  static Widget verticalSliverSpaceMedium(){
    return SliverToBoxAdapter(
      child: verticalSpaceMedium(),
    );
  }
  static Widget verticalSliverSpaceLarge(){
    return SliverToBoxAdapter(
      child: verticalSpaceLarge(),
    );
  }


  /// Returns a vertical space with height set to [verticalSpaceMedium]

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  static Widget horizontalSpaceLarge() {
    return horizontalSpace(_HorizontalSpaceLarge);
  }
  static Widget horizontalSpaceExtraLarge() {
    return horizontalSpace(_HorizontalSpaceExtraLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return SizedBox(width: width);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  static EdgeInsets get topIconPadding=>EdgeInsets.only(
      right:screenWidth * 0.04,top: screenHeight*.08) ;

  static EdgeInsets get sidePadding=>EdgeInsets.only(
      left: screenWidth * 0.04,right:screenWidth * 0.04 ) ;
  static EdgeInsets get innerSidePadding=>EdgeInsets.only(
      left: screenWidth * 0.02,right:screenWidth * 0.02 ) ;
  static EdgeInsets get innerMediumPadding=>EdgeInsets.only(
      left: screenWidth * 0.03,right:screenWidth * 0.03 ,top: screenHeight*.008,
      bottom:  screenHeight*.008) ;
  static EdgeInsets get padding=>EdgeInsets.only(
      left: screenWidth * 0.04,right:screenWidth * 0.04,top: screenHeight*.01,
      bottom:  screenHeight*.01) ;
  static EdgeInsets get tilePadding=>EdgeInsets.only(
      bottom:  screenHeight*.01) ;
  static EdgeInsets get smallPadding=>EdgeInsets.only(
      left: screenWidth * 0.02,right:screenWidth * 0.02,top: screenHeight*.005,
      bottom:  screenHeight*.005) ;
  static EdgeInsets get mediumPadding=>EdgeInsets.only(
      left: screenWidth * 0.05,right:screenWidth * 0.05,top: screenHeight*.015,
      bottom:  screenHeight*.015) ;

  static EdgeInsets get smallerPadding=>EdgeInsets.only(
      left: screenWidth * 0.04,right:screenWidth * 0.04,top: screenHeight*.0025,
      bottom:  screenHeight*.0025) ;
  static EdgeInsets get largePadding=>EdgeInsets.only(
      left: screenWidth * 0.12,right:screenWidth * 0.12,top: screenHeight*.01,
      bottom:  screenHeight*.01) ;
  static EdgeInsets get verticalPadding=>EdgeInsets.only(
      bottom:screenHeight * 0.005,top: screenHeight*.0005) ;
  static EdgeInsets get bottomPadding=>EdgeInsets.only(
    bottom:screenHeight * 0.015,) ;
  static List<BoxShadow>appShadow=[
    BoxShadow(
      color: Colors.black.withOpacity(.2),
      blurRadius: 10.0,
      spreadRadius: 0.0,
      offset: Offset(0.0, 10.0), // shadow direction: bottom right
    )
  ];

}
