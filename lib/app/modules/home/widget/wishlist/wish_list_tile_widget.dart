import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

class WishListTileWidget extends StatelessWidget {
  final Function? onTap,onDelete,onAddToCart;
  final ProductItemModel? item;
   WishListTileWidget({Key? key,this.onTap,this.item,this.onDelete,this.onAddToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap!=null)
          onTap!();
      },
      child: Stack(
        children: [
          Container(
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
                    emptyAssetUrl:AppAssets.defaultProduct,
                    imageUrl:item?.imageUrl??null,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),topRight: Radius.circular(30)
                    ),
                    // width: 60,
                    // height: 60,
                  ),
                ),
                SizeConfig.verticalSpaceSmall(),
                Padding(
                    padding: SizeConfig.sidePadding,
                    child: Container(
                      // height: SizeConfig.fontSizeLarge*2.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item?.name??'',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: AppStyles.smallTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                            ),),

                        ],
                      ),
                    )
                ),
                SizeConfig.verticalSpaceSmall(),
                CustomButtonWidget(onPressed: (){
                  if((item?.isCart??false)){
                    AppGetService.navigateTo(Routes.USER_CART);
                  }else{
                    if(onAddToCart!=null)
                      onAddToCart!();
                  }
                },buttonText: (item?.isCart??false)?AppString.goToCart.tr:AppString.addToCart.tr,
                  style: AppStyles.smallTextStyle.copyWith(
                    color: AppColors.whiteColor,fontWeight: FontWeight.w700
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),

                  ),
                height: 40,
                ),

              ],
            ),
          ),
          Positioned.fill(child: Align(
            alignment: Alignment.topRight,
            child: IconButton(icon: Icon(Icons.delete,color: AppColors.red,),onPressed: (){
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
