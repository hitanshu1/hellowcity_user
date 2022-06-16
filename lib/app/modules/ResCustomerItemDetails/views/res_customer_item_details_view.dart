import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/modules/ResCustomerItemDetails/widget/item_details_appbar_widget.dart';
import 'package:hellowcity/app/modules/ResCustomerItemDetails/widget/item_information_widget.dart';
import 'package:hellowcity/app/modules/ResCustomerItemDetails/widget/item_review_widget.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';

import '../controllers/res_customer_item_details_controller.dart';

class ResCustomerItemDetailsView extends GetView<ResCustomerItemDetailsController> {
  final ProductItemModel foodItem;
  ResCustomerItemDetailsView({required this.foodItem});



  Widget _bottomRow(bool isCart,available,ResCustomerItemDetailsController gxValues){
    if(available){
      return Row(
        children: [
          Container(
            height: SizeConfig.screenHeight*.08,
            decoration: BoxDecoration(
                color: AppColors.black
            ),
            child: Padding(
              padding: SizeConfig.sidePadding ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('(${gxValues.quantity}) '+AppString.items.tr,
                    style: AppStyles.smallerTextStyle.copyWith(
                        color: AppColors.whiteColor
                    ),),
                  Text(AppString.priceString.tr+'${gxValues.quantity*int.tryParse(gxValues.foodItem?.price??'0')!}',
                      style: AppStyles.mediumTextStyle.copyWith(
                          color: AppColors.whiteColor,fontWeight: FontWeight.bold
                      ))
                ],
              ),
            ),
          ),
          Expanded(child: InkWell(
            onTap: (){
              if(isCart){
                AppGetService.navigateTo(Routes.USER_CART);
              }else{
                gxValues.addToCart();
              }

            },
            child: Container(
              height: SizeConfig.screenHeight*.08,
              color: AppColors.green,
              child: Padding(
                padding: SizeConfig.sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(isCart?AppString.goToCart.tr:AppString.addToCart.tr,
                      style: AppStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.w700
                    ),),
                    SizeConfig.horizontalSpaceSmall(),
                    Icon(Icons.shopping_cart)
                  ],
                ),
              ),
            ),
          ))
        ],
      );
    }else{
      return Container();
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResCustomerItemDetailsController>(
        didChangeDependencies: (val){
          val.controller?.initializeData(foodItem);
        },
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemDetailsAppBarWidget(item:gxValues.foodItem,
                      onClickHeart: (){
                        gxValues.addToWishList();
                      },),
                    SizeConfig.verticalSpaceSmall(),
                    ItemInformationWidget(),
                    SizeConfig.verticalSpaceMedium(),
                    ItemReviewWidget(),

                  ],
                ),
              ),
              bottomNavigationBar: _bottomRow(gxValues.foodItem?.isCart??false,
                  gxValues.foodItem?.deliveryStatus??false, gxValues),
            ),
          );
        });
  }
}
