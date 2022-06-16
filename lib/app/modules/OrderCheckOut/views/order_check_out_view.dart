import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/apply_coupon_code_widget.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/custom_list_tile_widget.dart';
import 'package:hellowcity/app/shared/dot_widget.dart';
import 'package:hellowcity/app/shared/user_address_tile_widget.dart';

import '../controllers/order_check_out_controller.dart';
class OrderCheckOutView extends GetView<OrderCheckOutController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderCheckOutController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.checkOut.tr),
              ),
              body: Padding(
                padding: SizeConfig.padding,
                child: ListView(
                  children: [
                    SizeConfig.verticalSpaceMedium(),
                    Text(AppString.orderDetails.tr,style: AppStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.bold
                    ),),
                    SizeConfig.verticalSpaceMedium(),
                    CustomListTileWidget(
                      firstText: AppString.subTotal.tr,
                      firstStyle: AppStyles.smallerTextStyle,
                      secondText: AppString.priceString.tr+'${gxValues.orderDetails?.subTotal??''}',
                      secondStyle: AppStyles.smallerTextStyle.copyWith(
                          fontWeight: FontWeight.w800
                      ),
                    ),
                    SizeConfig.verticalSpaceSmall(),
                    CustomListTileWidget(
                      firstText: AppString.deliveryCharge.tr,
                      firstStyle: AppStyles.smallerTextStyle,
                      secondText: AppString.priceString.tr+'${gxValues.orderDetails?.deliveryCharge??'0'}',
                      secondStyle: AppStyles.smallerTextStyle.copyWith(
                          fontWeight: FontWeight.w800
                      ),
                    ),
                    if(gxValues.orderDetailsController.appCharge!.serviceTax>0)SizeConfig.verticalSpaceSmall(),
                    if(gxValues.orderDetailsController.appCharge!.serviceTax>0)CustomListTileWidget(
                      firstText: AppString.serviceTax.tr,
                      firstStyle: AppStyles.smallerTextStyle,
                      secondText: AppString.priceString.tr+'${gxValues.orderDetails?.serviceTax}',
                      secondStyle: AppStyles.smallerTextStyle.copyWith(
                          fontWeight: FontWeight.w800
                      ),
                    ),
                    SizeConfig.verticalSpaceSmall(),
                    CustomListTileWidget(
                      firstText: AppString.tax+' (${AppString.gst.tr} ${gxValues.orderDetailsController.appCharge?.gstPercentage}%)',
                      firstStyle: AppStyles.smallerTextStyle,
                      secondText: AppString.priceString.tr+'${gxValues.orderDetails?.tax}',
                      secondStyle: AppStyles.smallerTextStyle.copyWith(
                          fontWeight: FontWeight.w800
                      ),
                    ),


                    SizeConfig.verticalSpaceMedium(),
                    ApplyCouponCodeWidget(
                      controller: gxValues.couponCodeController,
                      onApply: (){
                        // model.onApplyCouponCode();
                      },
                    ),
                    SizeConfig.verticalSpaceMedium(),
                    DotWidget(totalWidth: SizeConfig.screenWidth*.92,
                        dashWidth: 10, emptyWidth: 5, dashHeight: 1, dashColor: AppColors.darkGrayColor),
                    SizeConfig.verticalSpaceMedium(),
                    CustomListTileWidget(
                      firstText: AppString.grandTotal.tr,
                      firstStyle: AppStyles.smallTextStyle,
                      secondText: AppString.priceString.tr+'${gxValues.orderDetails?.grandTotal}',
                      secondStyle: AppStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.w800
                      ),
                    ),
                    // if(gxValues.discountPercentage!=null)SizeConfig.verticalSpaceMedium(),
                    // if(model.discountPercentage!=null)CustomListTileWidget(
                    //   firstText: AppString.discount,
                    //   firstStyle: AppStyles.largeTextStyle,
                    //   secondText: '${model.discountPercentage}%',
                    //   secondStyle: AppStyles.largeTextStyle.copyWith(
                    //       fontWeight: FontWeight.w800
                    //   ),
                    // ),
                    // if(model.discountPercentage!=null)SizeConfig.verticalSpaceMedium(),
                    // if(model.discountPercentage!=null)CustomListTileWidget(
                    //   firstText: AppString.finalPrice,
                    //   firstStyle: AppStyles.largeTextStyle,
                    //   secondText: AppString.priceString+'${ NumberFormatter.convertNumber(model.amountAfterDiscount??'')}',
                    //   secondStyle: AppStyles.largeTextStyle.copyWith(
                    //       fontWeight: FontWeight.w800
                    //   ),
                    // ),
                    SizeConfig.verticalSpaceMedium(),
                    Text(AppString.deliveryAddress.tr,style: AppStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.bold
                    ),),
                    SizeConfig.verticalSpaceMedium(),
                    CustomButtonWidget(onPressed: (){
                      AppGetService.navigateTo(Routes.ADD_OR_CHANGE_DELIVERY_ADDRESS,
                          then: (val){
                            gxValues.initializeData();
                          });
                    },
                      gradient: AppColors.primaryLinearGradient,
                      buttonText: AppString.addOrChangeAddress.tr,),
                    SizeConfig.verticalSpaceMedium(),
                    if(gxValues.defaultAddress!=null)UserAddressTileWidget(
                        onTap: (){
                          // model.navigateToScreen(AddOrChangeDeliveryAddressScreen.routeName);
                        },onEdit: (){
                      AppGetService.navigateTo(Routes.ADD_OR_CHANGE_DELIVERY_ADDRESS,
                          argument: gxValues.defaultAddress,then: (val){
                            gxValues.initializeData();
                          });
                      // model.navigateToScreen(AddAddressScreen.routeName,
                      //     arguments: model.userDefaultAddress);
                    },
                        address: gxValues.defaultAddress!),
                    if(gxValues.unServiceableStoreResList.isNotEmpty)SizeConfig.verticalSpaceMedium(),
                    if(gxValues.unServiceableStoreResList.isNotEmpty)Padding(
                      padding: SizeConfig.sidePadding,
                      child: Column(
                        children: [
                          Text(AppString.noServiceableCartErrorMessage.tr,style: AppStyles.smallTextStyle.copyWith(
                              color: AppColors.red,fontWeight: FontWeight.w600
                          ),),
                          ListView.builder(itemCount: gxValues.unServiceableStoreResList.length,
                              physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context,int index){
                                return Text('${index+1}/ ${gxValues.unServiceableStoreResList[index].name??''}',
                                  style: AppStyles.smallerTextStyle.copyWith(color: AppColors.green,fontWeight: FontWeight.w700),);
                              })

                        ],
                      ),
                    ),
                    SizeConfig.verticalSpaceLarge(),
                    CustomButtonWidget(onPressed: (){
                      gxValues.onPlaceOrder();

                    },
                      gradient: (gxValues.defaultAddress!=null&&gxValues.unServiceableStoreResList.isEmpty)?AppColors.primaryLinearGradient:
                      AppColors.grayLinearGradient,
                      buttonText: AppString.placeOrder.tr,),
                    SizeConfig.verticalSpaceLarge(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
