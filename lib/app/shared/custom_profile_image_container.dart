import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

class CustomProfileImageContainer extends StatelessWidget {
  final String? imageUrl,assetUrl;
  final File?imageFile;
  final double ?size;
  const CustomProfileImageContainer({Key? key,this.imageUrl,this.assetUrl,this.size,this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size??100,
      height:  size??100,
      decoration: BoxDecoration(
          boxShadow: SizeConfig.appShadow,
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.whiteColor,width: 5),
          borderRadius: BorderRadius.circular(SizeConfig.borderRadius)
      ),
      child: ViewAppImage(
        radius: (size??100)*.1,
        width:  size??100,
        height:  size??100,
        imageUrl: imageUrl,
        assetsUrl:assetUrl,
        imageFile: imageFile,
      ),
    );
  }
}
