import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/UserCart/widget/cart_tile_widget.dart';
import 'package:hellowcity/app/modules/UserCart/widget/cart_total_amount_widget.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_date_service.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/number_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/empty_data_widget.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

import '../controllers/user_cart_controller.dart';
class UserCartView extends GetView<UserCartController> {
  

  Widget _swipeWidget({String? assetPath,String? text,bool isLeft=true}){
    return  Padding(
      padding: SizeConfig.sidePadding,
      child: Row(
        mainAxisAlignment: isLeft?MainAxisAlignment.start:MainAxisAlignment.end,
        children: [
          if(isLeft)ViewAppImage(
            assetsUrl: assetPath,
            assetsColor: AppColors.highlightColor,
            height: SizeConfig.iconSize,
            width: SizeConfig.iconSize,
          ),
          if(isLeft)SizeConfig.horizontalSpaceSmall(),
          Flexible(child: Text(text??'',
            style: AppStyles.smallTextStyle.copyWith(
                fontWeight: FontWeight.w600,color: AppColors.highlightColor
            ),)),
          if(!isLeft)SizeConfig.horizontalSpaceSmall(),
          if(!isLeft)ViewAppImage(
            assetsUrl: assetPath,
            assetsColor: AppColors.highlightColor,
            height: SizeConfig.iconSize,
            width: SizeConfig.iconSize,
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserCartController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.yourCart.tr),
              ),
              body:Column(
                children: [
                  SizeConfig.verticalSpaceMedium(),
                  _swipeWidget(
                    assetPath:AppAssets.swipeLeft,
                    text: AppString.swipeLeftToDeletePermanently.tr
                  ),
                  _swipeWidget(
                    isLeft: false,
                      assetPath:AppAssets.swipeRight,
                      text: AppString.swipeRightToDeleteAddToWishList.tr
                  ),
                  SizeConfig.verticalSpaceSmall(),
                  Expanded(
                    child: Padding(
                      padding: SizeConfig.padding,
                      child: gxValues.productList.length>0?ListView.builder(
                          itemCount: gxValues.productList.length,
                          itemBuilder: (context,int index){
                            return Padding(
                              padding: SizeConfig.tilePadding.copyWith(
                                  bottom: index==gxValues.productList.length-1?SizeConfig.screenHeight*.09:
                                  SizeConfig.tilePadding.bottom
                              ),
                              child: Dismissible(

                                // key:Key(gxValues.productList[index].id?.toString()??''),
                                key: UniqueKey(),
                                onDismissed: (direction){
                                  print(direction);
                                  if(direction==DismissDirection.endToStart){
                                    gxValues.deleteCartProduct(gxValues.productList[index]);
                                  }else{
                                    gxValues.deleteAndAddToWishList(gxValues.productList[index]);
                                  }

                                  // ;
                                },
                                child: CartTileWidget(
                                  isOpenNow: AppDateService.checkStoreResProductAvailability(gxValues.productList[index].storeRestaurant?.timeTable),
                                  available:gxValues.productList[index].available??true,
                                  item: gxValues.productList[index],
                                  onIncreaseQuantity: (){
                                    gxValues.onIncreaseProduct(gxValues.productList[index]);
                                  },
                                  onDecreaseQuantity: (){
                                    gxValues.onDecreaseProduct(gxValues.productList[index]);
                                  },
                                ),
                              ),
                            );
                          }):EmptyDataWidget(text: AppString.noProductFound.tr,),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar:gxValues.productList.isNotEmpty?CartTotalAmountWidget(
                totalAmount: NumberService.getTotalPrice(gxValues.productList),
                onTap: (){
                  gxValues.onClickProceed();


                },
              ):Container(height: 0,),
            ),
          );
        });
  }
}
