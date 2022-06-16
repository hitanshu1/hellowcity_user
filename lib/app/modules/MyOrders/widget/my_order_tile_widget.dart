import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/model/store_restaurant_order_model.dart';
import 'package:hellowcity/app/services/app_date_time_format_service.dart';
import 'package:hellowcity/app/services/app_string_service.dart';
import 'package:hellowcity/app/shared/custom_offer_tile_shape.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

class MyOrderTileWidget extends StatelessWidget {
  final StoreRestaurantOrderModel order;
  const MyOrderTileWidget({Key? key,required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTileShape(
        showShadow: true,
        child: Padding(
          padding: SizeConfig.innerMediumPadding.copyWith(
              top: SizeConfig.screenHeight*.01,
              bottom: SizeConfig.screenHeight*.01
          ),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ViewAppImage(
                radius: 10,
                fit: BoxFit.contain,
                height: SizeConfig.screenWidth*.3,
                width: SizeConfig.screenWidth*.2,
                imageUrl: order.storeRestaurant?.image,
                emptyAssetUrl: AppAssets.defaultProduct,
              ),
              SizeConfig.horizontalSpaceSmall(),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text('OrderID'+' #${order.id}',style: AppStyles.smallTextStyle.copyWith(
                      color: AppColors.black,fontWeight: FontWeight.w700
                  ),),
                  SizeConfig.verticalSpaceSmall(),
                  if(order.productItemList?.isNotEmpty??false)Text(order.productItemList?.first.name??'',style: AppStyles.smallerTextStyle.copyWith(
                      color: AppColors.black,fontWeight: FontWeight.w600
                  ),),
                  if((order.productItemList?.length??1)>1)Text('and ${(order.productItemList?.length??1)-1} '+'more items',
                    style: AppStyles.smallerTextStyle.copyWith(color: AppColors.black),),
                  Text('Ordered: '+AppDateTimeFormatService.dateWithTime(DateTime.parse(order.createdAt!)),
                    style: AppStyles.smallerTextStyle.copyWith(color: AppColors.black),),
                  SizeConfig.verticalSpaceSmall(),
                  Text(AppString.status.tr+': '+AppStringService.getOrderStatus(order.orderStatus),
                    style: AppStyles.smallerTextStyle.copyWith(
                        color: AppColors.statusColor(order.orderStatus),fontWeight: FontWeight.w600
                    ),)
                ],
              ))
            ],
          ),
        ));
  }
}
