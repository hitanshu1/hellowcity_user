import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_constant.dart';
import 'package:hellowcity/app/data/size_config.dart';

class ViewAppImage extends StatelessWidget {
  final String? imageUrl;
  final File? imageFile;
  final String? assetsUrl,emptyAssetUrl;
  final double? height;
  final double? width;
  final double radius;
  final BorderRadius? borderRadius;
  final Color? assetsColor;
  final BoxFit? fit;
  final bool showDelete;
  final Function?onDelete;

  ViewAppImage({this.onDelete,this.showDelete:false,this.fit,this.imageUrl,this.assetsColor,this.emptyAssetUrl,this.width,this.height,this.radius:0.0,this.assetsUrl,this.imageFile,this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,height: height,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: borderRadius!=null?borderRadius:BorderRadius.all(Radius.circular(radius)),
            child: imageFile!=null?Container(
              width: width,height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(image: FileImage(imageFile!),fit: fit??BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ):Container(
              width: width??SizeConfig.screenWidth,height: height??SizeConfig.screenHeight,
              child: imageUrl!=null&&imageUrl!=''?CachedNetworkImage(imageUrl:imageUrl!,
                errorWidget: (context, url, error) => Image.asset(assetsUrl!=null?assetsUrl!:(emptyAssetUrl??AppAssets.noImage),fit: fit??BoxFit.contain,),
                fit: fit??BoxFit.cover,
                placeholder: (context, url) =>Container(
                  width: 40,height: 40,
                  child: AppConstants.circularProgressIndicator(),
                ),):Image.asset(assetsUrl!=null?assetsUrl!:(emptyAssetUrl??AppAssets.noImage),fit: fit??BoxFit.contain,color: assetsColor,),
            ),
          ),
          if(showDelete)Positioned.fill(child: Align(
            alignment: Alignment.topRight,
            child: IconButton(icon: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(.4),
                shape: BoxShape.circle
              ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.delete,color: AppColors.red,),
                )),
            onPressed: (){
              if(onDelete!=null){
                onDelete!();
              }
            },),

          ))
        ],
      ),
    );
  }
}

