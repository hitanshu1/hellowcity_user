import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'custom_card.dart';

class CustomTileShape extends StatelessWidget {
  final Widget child;
  final Color? color;
  final bool showShadow;
  const CustomTileShape({Key? key,required this.child,this.color,this.showShadow:false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
            color: color??AppColors.primaryColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(SizeConfig.borderRadius),
          boxShadow: showShadow?SizeConfig.appShadow:null
        ),
        width: SizeConfig.screenWidth,
        child: Padding(
          padding: SizeConfig.sidePadding,
          child: child,
        ),
      ),
    );
  }
}
