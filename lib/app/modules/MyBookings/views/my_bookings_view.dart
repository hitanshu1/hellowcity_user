import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/booking_model.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/app_string_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/app_title_tile_widget.dart';
import 'package:hellowcity/app/shared/custom_offer_tile_shape.dart';
import 'package:hellowcity/app/shared/empty_data_widget.dart';

import '../controllers/my_bookings_controller.dart';

class MyBookingsView extends GetView<MyBookingsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyBookingsController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.myBookings.tr),
                centerTitle: true,
              ),
              body: Padding(
                padding: SizeConfig.padding,
                child: gxValues.bookingList.isNotEmpty?ListView.builder(itemCount: gxValues.bookingList.length,
                    itemBuilder: (context,int index){
                      BookingModel _booking=gxValues.bookingList[index];
                      return Padding(
                        padding: SizeConfig.tilePadding,
                        child: GestureDetector(
                          onTap: (){
                            AppGetService.navigateTo(Routes.BOOKING_DETAILS,
                            argument: _booking);
                          },
                          child: CustomTileShape(

                            showShadow: true,
                            child: Padding(
                              padding: SizeConfig.padding,
                              child: Column(
                                children: [
                                  SizeConfig.verticalSpaceSmall(),
                                  AppTitleTileWidget(
                                    firstText: AppString.bookingId.tr,
                                    secondText:'#${_booking.id}' ,
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
                                    secondText:'${_booking.storeRestaurant?.name}' ,
                                  ),
                                  SizeConfig.verticalSpaceSmall(),
                                  AppTitleTileWidget(
                                    firstText: AppString.cabin.tr,
                                    secondText:'${_booking.cabin?.name}' ,
                                  ),
                                  AppTitleTileWidget(

                                    firstText: AppString.status.tr,
                                    firstTextStyle: AppStyles.smallTextStyle.copyWith(
                                        color: AppColors.statusColor(_booking.status),fontWeight: FontWeight.w700
                                    ),
                                    secondTextStyle:  AppStyles.smallTextStyle.copyWith(
                                        color:AppColors.statusColor(_booking.status),fontWeight: FontWeight.w700
                                    ),
                                    secondText:AppStringService.getOrderStatus(_booking.status) ,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }):EmptyDataWidget(
                  text: AppString.youHaveNotBookAnyCabinYet.tr,
                ),
              ),
            ),
          );
        });
  }
}
