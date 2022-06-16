import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/enum/device_type.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final double? radius;
  final Color? textColor;
  final double? fontSize;
  final LinearGradient? gradient;
  final GestureTapCallback onPressed;

  final double? width,height;
  final Widget? child;
  final FontWeight? fontWeight;
  final double? elevation;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final bool isBorderColor ;
  final TextStyle? style;


  CustomButtonWidget({Key? key,
    required this.onPressed,
    this.buttonText,
    this.buttonColor,
    this.radius,
    this.textColor,
    this.fontSize,
    this.gradient,
    this.height,
    this.style,
    this.width, this.child, this.fontWeight, this.elevation,this.borderRadius,this.border,this.isBorderColor:false}):
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
        onPressed();
      },
      child: Container(
        height: height??(SizeConfig.deviceType==DeviceType.tablet?70:40),
        width: width != null ? width : SizeConfig.screenWidth,
        decoration: BoxDecoration(
            borderRadius: borderRadius??BorderRadius.circular(radius??SizeConfig.borderRadius),
          gradient:gradient?? AppColors.primaryLinearGradient,
          border:isBorderColor?Border.all(color: AppColors.whiteColor,width: 2): border,
          color: buttonColor
        ),
        child: Center(
          child: child ?? Padding(
            padding: SizeConfig.sidePadding,
            child: Text(
              buttonText??'',
              maxLines: 1,
              style: style??AppStyles.mediumTextStyle.copyWith(
                color: AppColors.whiteColor,fontWeight: FontWeight.w700
              ),
            ),
          ),
        ),
      ),
    );
  }
}
