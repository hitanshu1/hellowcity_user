import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'app_title_design.dart';
import 'custom_product_price_widget.dart';
import 'custom_rating_widget.dart';
import 'view_app_image.dart';

class ViewProductListTile extends StatelessWidget {
  final ProductItemModel product;
  final bool isAvailable;
  final Function? onTap;
  const ViewProductListTile({Key? key,required this.product,this.isAvailable=true,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap!=null){
          onTap!();
        }
      },
      child: Stack(
        children: [
          AppTileDesign(
            child: Padding(
              padding: SizeConfig.padding,
              child: Row(
                children: [
                  ViewAppImage(
                    imageUrl: product.imageUrl,
                    emptyAssetUrl: AppAssets
                        .defaultFoodAsset,
                    height: 70,
                    width: 70,
                  ),
                  SizeConfig.horizontalSpaceSmall(),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    mainAxisAlignment: MainAxisAlignment
                        .start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(product.name ?? '',
                              style: AppStyles.smallTextStyle
                                  .copyWith(
                                  fontWeight: FontWeight
                                      .w700),),

                          ),
                          SizeConfig.horizontalSpaceSmall(),
                          CustomRatingWidget(initialRating: product.rating??0, enable: false  ,)
                        ],
                      ),
                      Text(product.description ?? '',
                        style: AppStyles
                            .smallerTextStyle.copyWith(
                            fontWeight: FontWeight
                                .w600),),
                      CustomProductPriceWidget(
                          product: product)
                    ],
                  ))
                ],
              ),
            ),
          ),
          if(!isAvailable)Positioned.fill(child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.black.withOpacity(.5)
            ),
            child: Center(
              child: Text(AppString.closed.tr,style: AppStyles.largeTextStyle.copyWith(
                  color: AppColors.whiteColor,fontWeight: FontWeight.w700
              ),),
            ),
          ))
        ],
      ),
    );
  }
}
