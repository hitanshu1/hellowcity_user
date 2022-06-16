import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/store_restaurant_order_model.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/app_title_design.dart';
import 'package:hellowcity/app/shared/app_title_tile_widget.dart';
import 'package:hellowcity/app/shared/custom_offer_tile_shape.dart';
import 'package:hellowcity/app/shared/empty_data_widget.dart';

import '../controllers/active_cabin_controller.dart';

class ActiveCabinView extends GetView<ActiveCabinController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActiveCabinController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.activeCabin.tr),
                centerTitle: true,
              ),
              body:Padding(
                padding: SizeConfig.padding,
                child: gxValues.activeCabinOrder.isNotEmpty?ListView.builder(itemCount: gxValues.activeCabinOrder.length,
                    itemBuilder: (context,int index){
                  StoreRestaurantOrderModel _order=gxValues.activeCabinOrder[index];
                  return Padding(
                    padding: SizeConfig.tilePadding,
                    child: GestureDetector(
                      onTap: (){
                        AppGetService.navigateTo(Routes.ACTIVE_CABIN_ORDER_DETAILS,
                        argument: _order);
                      },
                      child: CustomTileShape(

                        showShadow: true,
                        child: Padding(
                          padding: SizeConfig.padding,
                          child: Column(
                            children: [
                              SizeConfig.verticalSpaceSmall(),
                              AppTitleTileWidget(
                                firstText: AppString.orderNumber.tr,
                                secondText:'#${_order.id}' ,
                              ),
                              SizeConfig.verticalSpaceSmall(),
                              AppTitleTileWidget(

                                firstText: AppString.restaurantDhaba.tr,
                                firstTextStyle: AppStyles.smallTextStyle.copyWith(
                                  color: AppColors.highlightColor,fontWeight: FontWeight.w700
                                ),
                                secondTextStyle:  AppStyles.smallTextStyle.copyWith(
                                    color: AppColors.highlightColor,fontWeight: FontWeight.w700
                                ),
                                secondText:'${_order.storeRestaurant?.name}' ,
                              ),
                              SizeConfig.verticalSpaceSmall(),
                              AppTitleTileWidget(
                                firstText: AppString.cabin.tr,
                                secondText:'${_order.cabin?.name}' ,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }):EmptyDataWidget(
                  text: AppString.noActiveOrder.tr,
                ),
              ),
            ),
          );
        });
  }
}
