import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/enum/device_type.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';


import 'view_app_image.dart';


class CustomSmallTileWidget extends StatelessWidget {
  final Function? onTap;
  final String? title,imageUrl,emptyImageAsset;
  final bool isAssetsImage;
  CustomSmallTileWidget({Key? key, this.imageUrl,this.emptyImageAsset,this.onTap,this.title,this.isAssetsImage:false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap!=null)
          onTap!();
      },
      child: Container(
        height: SizeConfig.smallTileHeight,
        width:  SizeConfig.smallTileHeight*.7,
        decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            boxShadow: SizeConfig.appShadow,
            borderRadius: BorderRadius.circular(SizeConfig.smallTileHeight*.23),
        ),
        child: Padding(
          padding: SizeConfig.sidePadding,
          child: Column(
            children: [
              SizeConfig.verticalSpaceMedium(),
              ViewAppImage(
                radius: 5,
                width: SizeConfig.smallTileHeight*.6,
                height: SizeConfig.smallTileHeight*.6,
                emptyAssetUrl: emptyImageAsset,
                assetsUrl:isAssetsImage?imageUrl:null,
                imageUrl: isAssetsImage?null:imageUrl,
              ),
              SizeConfig.verticalSpaceSmall(),
              Text(title??'',maxLines: 3,
                textAlign: TextAlign.center,
                style: AppStyles.smallerTextStyle.copyWith(
                    color: AppColors.primaryColor
                ),),

            ],
          ),
        ),
      ),
    );
  }
}
