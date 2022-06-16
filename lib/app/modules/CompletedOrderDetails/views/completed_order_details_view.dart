import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/store_restaurant_order_model.dart';
import 'package:hellowcity/app/services/app_date_time_format_service.dart';
import 'package:hellowcity/app/services/number_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/app_title_design.dart';
import 'package:hellowcity/app/shared/app_title_tile_widget.dart';
import 'package:hellowcity/app/shared/app_title_widget.dart';
import 'package:hellowcity/app/shared/custom_focus_container.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';
import 'package:hellowcity/app/shared/price_with_quantity_text.dart';

import '../controllers/completed_order_details_controller.dart';

class CompletedOrderDetailsView
    extends GetView<CompletedOrderDetailsController> {
  final StoreRestaurantOrderModel order;
  CompletedOrderDetailsView({required this.order});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.orderDetails.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: SizeConfig.sidePadding,
        child: CustomListView(
          children: [
            SizeConfig.verticalSpaceMedium(),
            AppTitleTileWidget(
              firstText: AppString.from.tr,
              firstTextStyle: AppStyles.smallTextStyle.copyWith(
                color: AppColors.highlightColor,fontWeight: FontWeight.w700
              ),
              secondTextStyle: AppStyles.smallTextStyle.copyWith(
                  color: AppColors.highlightColor,fontWeight: FontWeight.w700
              ),
              secondText: '${order.storeRestaurant?.name??''}',
            ),
            SizeConfig.verticalSpaceSmall(),
            AppTitleTileWidget(
              firstText: AppString.date.tr,
              secondText: AppDateTimeFormatService.getDateMonthYear(order.createdAt),
            ),
            SizeConfig.verticalSpaceSmall(),
            AppTitleTileWidget(
              firstText: AppString.gst.tr,
              secondText: '${order.storeRestaurant?.gstPercentage??'0'}%',
            ),
            AppTitleTileWidget(
              firstText: AppString.appCharge.tr,
              secondText: '${order.appCharge??'0'}',
            ),
            SizeConfig.verticalSpaceSmall(),

            CustomFocusContainer(

              child: AppTitleTileWidget(
                firstText: AppString.total.tr,
                secondText: AppString.rupee +(order.grandTotal??''),
                secondTextStyle: AppStyles.smallTextStyle.copyWith(
                  color: AppColors.red,
                  fontWeight: FontWeight.w700,

                ),
              ),
            ),
            SizeConfig.verticalSpaceSmall(),
            AppTitleWidget(
              title: AppString.foodItemLists.tr + ":",
            ),
            SizeConfig.verticalSpaceSmall(),
            AppLoadingWidget(
              child:CustomListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: order.productItemList?.length??0,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: SizeConfig.tilePadding,
                      child: AppTileDesign(
                        child: ListTile(
                          leading: Container(
                              width: SizeConfig.screenWidth * .2,
                              child: Text(order.productItemList?[index].name ?? '',
                                style: AppStyles.smallTextStyle.copyWith(
                                    fontWeight: FontWeight.w600
                                ), maxLines: 2,)),
                          title: PriceWithQuantityText(productItem: order.productItemList![index],),

                        ),
                      ),
                    );
                  }),
            )

          ],
        ),
      ),
    );
  }
}
