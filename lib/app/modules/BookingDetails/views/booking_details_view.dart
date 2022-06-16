import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/booking_model.dart';
import 'package:hellowcity/app/services/app_string_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/app_title_tile_widget.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';

import '../controllers/booking_details_controller.dart';

class BookingDetailsView extends GetView<BookingDetailsController> {
  final BookingModel booking;
  BookingDetailsView({required this.booking});


  Widget _floatingButton(BookingDetailsController gxValues) {
    if(gxValues.booking?.status==ApiCheckingStings.pendingForApproval){
      return CustomButtonWidget(onPressed: (){
        gxValues.onUpdateBookingStatus(ApiCheckingStings.cancelByUser);

      },buttonText: AppString.cancel.tr,width: SizeConfig.screenWidth*.3,
        gradient: AppColors.redLinearGradient,);
    }else if(gxValues.booking?.status==ApiCheckingStings.pendingForPayment){
      return CustomButtonWidget(onPressed: (){
        gxValues.payCashFreePlugIn();

      },buttonText: AppString.payAndBook.tr,width: SizeConfig.screenWidth*.3,
        style: AppStyles.smallerTextStyle.copyWith(
          fontWeight: FontWeight.w700,color: AppColors.whiteColor
        ),
        gradient: AppColors.primaryLinearGradient,);
    }

    return Container();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailsController>(
      didChangeDependencies: (val){
        val.controller?.initializeData(booking);
      },
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.bookingDetails.tr),
                centerTitle: true,
              ),
              body: Padding(
                padding: SizeConfig.padding,
                child: ListView(
                  children: [
                    SizeConfig.verticalSpaceMedium(),
                    AppTitleTileWidget(
                      firstText: AppString.bookingId.tr,
                      secondText: '#${gxValues.booking?.id??''}',
                    ),
                    SizeConfig.verticalSpaceSmall(),
                    AppTitleTileWidget(
                      firstText: AppString.restaurantDhaba.tr,
                      secondText: '${gxValues.booking?.storeRestaurant?.name??''}',
                      firstTextStyle: AppStyles.smallTextStyle.copyWith(
                          color: AppColors.highlightColor,fontWeight: FontWeight.w700
                      ),
                      secondTextStyle:  AppStyles.smallTextStyle.copyWith(
                          color:AppColors.highlightColor,fontWeight: FontWeight.w700
                      ),
                    ),
                    SizeConfig.verticalSpaceSmall(),
                    AppTitleTileWidget(
                      firstText: AppString.cabin.tr,
                      secondText: '${gxValues.booking?.cabin?.name??''}',
                    ),
                    SizeConfig.verticalSpaceSmall(),
                    AppTitleTileWidget(
                      firstText: AppString.status.tr,
                      firstTextStyle: AppStyles.smallTextStyle.copyWith(
                          color: AppColors.statusColor(gxValues.booking?.status),fontWeight: FontWeight.w700
                      ),
                      secondTextStyle:  AppStyles.smallTextStyle.copyWith(
                          color:AppColors.statusColor(gxValues.booking?.status),fontWeight: FontWeight.w700
                      ),
                      secondText: AppStringService.getOrderStatus(gxValues.booking?.status),
                    ),
                    SizeConfig.verticalSpaceSmall(),

                  ],
                ),
              ),
              floatingActionButtonLocation: gxValues.booking?.status==ApiCheckingStings.pendingForApproval?FloatingActionButtonLocation.startDocked:
              FloatingActionButtonLocation.endDocked,
              floatingActionButton: Padding(
                padding: SizeConfig.verticalPadding.copyWith(
                  bottom: SizeConfig.screenHeight*.03
                ),
                child:_floatingButton(gxValues),
              ),
            ),
          );
        });
  }
}
