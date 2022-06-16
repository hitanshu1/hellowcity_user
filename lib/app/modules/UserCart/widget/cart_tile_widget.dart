import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/shared/custom_quantity_widget.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

class CartTileWidget extends StatelessWidget {
  final ProductItemModel item;
  final Function? onIncreaseQuantity,onDecreaseQuantity;
  final bool available,showQuantity;
  final bool isOpenNow;
   CartTileWidget({Key? key,required this.item,this.onDecreaseQuantity,
   this.onIncreaseQuantity,required this.available,this.showQuantity:true,this.isOpenNow=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: available?1:.5,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: SizeConfig.appShadow,
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(SizeConfig.radiusSmall)
            ),
            child: Padding(
              padding: SizeConfig.smallerPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: SizeConfig.padding.copyWith(
                      left: 0,right: 0
                    ),
                    child: ViewAppImage(
                      height: SizeConfig.screenHeight*.12,
                      width: SizeConfig.screenHeight*.12,
                      radius: SizeConfig.radiusSmall,
                      emptyAssetUrl: AppAssets.defaultProduct,
                      imageUrl: (item.imageUrl!=null)?item.imageUrl:null,
                    ),
                  ),
                  SizeConfig.horizontalSpaceSmall(),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizeConfig.verticalSpaceMedium(),
                      Text(item.name??'',
                      style: AppStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.bold,color: AppColors.primaryColor
                      ),),
                      SizeConfig.verticalSpaceSmall(),
                      Text(item.storeRestaurant?.name?.toUpperCase()??'',
                          style: AppStyles.smallerTextStyle.copyWith(
                            fontWeight: FontWeight.bold
                        ),),
                      Text(AppString.priceString.tr+(item.price??'')+' X '+'${item.quantity}',
                        style: AppStyles.smallerTextStyle.copyWith(
                            fontWeight: FontWeight.bold
                        ),),
                      SizeConfig.verticalSpaceSmall(),
                      if(showQuantity)CustomQuantityWidget(quantity: item.quantity,
                      onIncrease: onIncreaseQuantity,onDecrease: onDecreaseQuantity,),
                      SizeConfig.verticalSpaceSmall(),

                    ],
                  ))
                ],
              ),
            ),
          ),
          if(!isOpenNow)Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(.3),
                    borderRadius: BorderRadius.circular(SizeConfig.radiusSmall)
                ),
                child: Center(
                  child: Text(AppString.closed.tr,
                  style: AppStyles.largeTextStyle.copyWith(
                    fontWeight: FontWeight.w700,color: AppColors.whiteColor
                  ),),
                ),
              ))
        ],
      ),
    );
  }
}
