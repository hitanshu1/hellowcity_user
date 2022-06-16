import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

class CustomSmallImageWidget extends StatelessWidget {
  final File? fileImage;
 final String ?imageUrl;
 final double ? height;
 final String ?assetPath;
 final bool showDelete;
 final Function? onDelete;
  const CustomSmallImageWidget({Key? key,this.onDelete,this.showDelete:false,this.assetPath,this.fileImage,this.imageUrl,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewAppImage(
      showDelete: showDelete,
      onDelete: (){
        if(onDelete!=null){
          onDelete!();
        }
      },

      imageFile: fileImage,
      assetsUrl: assetPath,
      imageUrl: imageUrl,
      radius: (height??SizeConfig.screenHeight*.1)*.2,
      height: height??SizeConfig.screenHeight*.1,
      width: height??SizeConfig.screenHeight*.1,
    );
  }
}
