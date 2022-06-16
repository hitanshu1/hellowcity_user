import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/offer_app_data.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/offer_model.dart';
import '../custom_offer_tile_shape.dart';
import '../view_app_image.dart';

class RestaurantOfferTileWidget extends StatelessWidget {
 final StoreResOfferModel offer;
  const RestaurantOfferTileWidget({Key? key,required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTileShape(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizeConfig.verticalSpaceMedium(),
                Text(OfferAppData.getTypeFromValue(offer.type!),style: AppStyles.mediumTextStyle.copyWith(
                    color: AppColors.green,fontWeight: FontWeight.bold
                ),),
                Text(OfferAppData.getSubTypeFromValue(offer),style: AppStyles.smallTextStyle.copyWith(
                    color: AppColors.red,fontWeight: FontWeight.bold
                ),),
                Text(offer.restaurant?.name??'',style: AppStyles.mediumTextStyle.copyWith(
                    color: AppColors.highlightColor,fontWeight: FontWeight.bold
                ),),

                if(offer.subtype==ApiCheckingStings.itemOnly)Row(
                  children: [
                    Text(AppString.orderNow.tr,style: AppStyles.smallerTextStyle.copyWith(
                        color: AppColors.black,fontWeight: FontWeight.w700
                    ),),
                    SizeConfig.horizontalSpaceSmall(),
                    Icon(Icons.forward)
                  ],
                ),
              ],
            ),
          ),
          SizeConfig.horizontalSpaceSmall(),
          ViewAppImage(
            radius: 10,
            width: SizeConfig.screenWidth*.3,
            height: 100,
            imageUrl: offer.restaurant?.image,
            emptyAssetUrl: AppAssets.restaurant,
          )
        ],
      ),
    );
  }
}
