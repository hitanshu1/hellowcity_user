import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';

import 'package:hellowcity/app/shared/view_app_image.dart';

class CustomTileWithDescription extends StatelessWidget {
  final Function? onTap;
  final String? title,imageUrl,description, price,emptyAsset,offerPrice;
  final bool isAssetsImage;
  final TextStyle? titleStyle,descriptionStyle,priceStyle;
   CustomTileWithDescription({Key? key,this.price,this.emptyAsset,this.title,this.imageUrl,this.description,this.isAssetsImage=false,this.onTap,
   this.descriptionStyle,this.priceStyle,this.titleStyle,this.offerPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap!=null) {
          onTap!();
        }
      },
      child: Container(
        // height: 150,
        // width: 100,
        decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow:SizeConfig.appShadow
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ViewAppImage(
                emptyAssetUrl: emptyAsset,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),topRight: Radius.circular(30)
                ),
                // width: 60,
                // height: 60,
                assetsUrl:isAssetsImage?imageUrl:null,
                imageUrl: isAssetsImage?null:imageUrl,
              ),
            ),
            SizeConfig.verticalSpaceSmall(),
            Padding(
              padding: SizeConfig.sidePadding,
              child: Text(title??'',maxLines: 3,
                textAlign: TextAlign.center,
                style: titleStyle??AppStyles.smallTextStyle.copyWith(
                    color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold
                ),),
            ),
            // SizeConfig.verticalSpaceSmall(),
            if(price!=null)Padding(
              padding: SizeConfig.sidePadding,
              child:RichText(
                text: TextSpan(
                  text: offerPrice!=null?'':AppString.priceString.tr+(price??''),
                  style: priceStyle??AppStyles.smallerTextStyle.copyWith(
                      color: AppColors.primaryColor,fontWeight: FontWeight.w700
                  ),
                  children:  <TextSpan>[
                    if(offerPrice!=null)TextSpan(text: AppString.priceString.tr+(price??'')+' ', style: priceStyle??AppStyles.smallerTextStyle.copyWith(
                        color: AppColors.red,fontWeight: FontWeight.w700,decoration: TextDecoration.lineThrough
                    )),
                    if(offerPrice!=null)TextSpan(text: AppString.priceString.tr+(offerPrice??''),
                      style: priceStyle??AppStyles.smallerTextStyle.copyWith(
                          color: AppColors.primaryColor,fontWeight: FontWeight.w700
                      ),),
                  ],
                ),
              )
              // Text(AppString.priceString.tr+(price??''),maxLines: 3,
              //   textAlign: TextAlign.center,
              //   style: priceStyle??AppStyles.smallerTextStyle.copyWith(
              //       color: AppColors.primaryColor
              //   ),),
            ),
            if(description!=null)Padding(
              padding: SizeConfig.sidePadding,
              child: Text(description??'',maxLines: 3,
                textAlign: TextAlign.center,
                style: descriptionStyle??AppStyles.smallerTextStyle.copyWith(
                    color: AppColors.primaryColor
                ),),
            ),

            SizeConfig.verticalSpaceSmall(),

          ],
        ),
      ),
    );
  }
}
