import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/store_restaurant_order_model.dart';
import 'package:hellowcity/app/modules/MyOrders/widget/my_order_tile_widget.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_date_time_format_service.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/app_string_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_offer_tile_shape.dart';
import 'package:hellowcity/app/shared/empty_data_widget.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

import '../controllers/my_orders_controller.dart';


class MyOrdersView extends GetView<MyOrdersController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrdersController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.myOrders.tr),
                centerTitle: true,
              ),
              body: gxValues.orderList.isNotEmpty?Padding(
                padding: SizeConfig.sidePadding.copyWith(
                    top: SizeConfig.screenHeight*.02
                ),
                child: ListView.builder(
                    itemCount: gxValues.orderList.length,
                    itemBuilder: (context,int index){
                      StoreRestaurantOrderModel _order=gxValues.orderList[index];
                      return  Banner(
                        location: BannerLocation.topStart,
                        message: AppStringService.getOrderType(_order.orderType),
                        child: Padding(
                          padding: SizeConfig.tilePadding,
                          child: GestureDetector(
                            onTap: (){
                              if(_order.orderType?.toLowerCase()==ApiCheckingStings.cabinOrder&&_order.orderStatus?.toLowerCase()==ApiCheckingStings.ongoing){
                                AppGetService.navigateTo(Routes.ACTIVE_CABIN_ORDER_DETAILS,
                                argument: _order);
                              }else{
                                AppGetService.navigateTo(Routes.COMPLETED_ORDER_DETAILS,
                                argument: _order);
                              }
                            },
                              child: MyOrderTileWidget(order: _order)),
                        ),
                      );
                    }),
              ):EmptyDataWidget(text: AppString.noDataAvailable.tr,),
            ),
          );
        });
  }
}
