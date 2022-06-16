import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

class AppProfileImageWidget extends StatelessWidget {
  final String ?imageUrl,emptyImageUrl;
   AppProfileImageWidget({Key? key,this.imageUrl,this.emptyImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          boxShadow: SizeConfig.appShadow,
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.whiteColor,width: 5),
          borderRadius: BorderRadius.circular(SizeConfig.borderRadius)
      ),
      child: ViewAppImage(
        radius: SizeConfig.borderRadius,
        width: 100,
        height: 100,
        assetsUrl:emptyImageUrl,
        imageUrl: imageUrl,
      ),
    );
  }
}
