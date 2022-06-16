import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/OrderDetails/widget/view_cart_item_by_store_res_tile.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_bottom_show_price_button.dart';
import 'package:hellowcity/app/shared/custom_list_tile_widget.dart';
import 'package:hellowcity/app/shared/dot_widget.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailsController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.orderDetails.tr),
              ),
              body: Padding(
                padding: SizeConfig.padding,
                child: ListView(
                  children: [
                    Text(AppString.orderTermAndCondition.tr,
                      style: AppStyles.smallerTextStyle.copyWith(
                          color: AppColors.red
                      ),textAlign: TextAlign.center,),
                    SizeConfig.verticalSpaceSmall(),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              AppString.paymentSummary.tr,
                              style: AppStyles.mediumTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,color: AppColors.primaryColor
                              ),
                            ),
                          ),
                          ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                              itemCount: gxValues.orderDetails?.itemWithStoreList?.length??0,
                              itemBuilder: (context,int index){
                                return Padding(
                                  padding: SizeConfig.tilePadding,
                                  child: ViewCartItemByStoreResTile(storeResWithProductItem: gxValues.orderDetails!.itemWithStoreList![index],),
                                );
                              }),
                          SizeConfig.verticalSpaceMedium(),
                          DotWidget(totalWidth: SizeConfig.screenWidth*.83,
                              dashWidth: 10, emptyWidth: 5, dashHeight: 1, dashColor: AppColors.darkGrayColor),

                          if((gxValues.appCharge?.serviceTax??0)>0)SizeConfig.verticalSpaceMedium(),
                          if((gxValues.appCharge?.serviceTax??0)>0)Padding(
                            padding: SizeConfig.sidePadding,
                            child: CustomListTileWidget(
                              firstText: AppString.serviceTax.tr,
                              firstStyle: AppStyles.smallerTextStyle.copyWith(
                                  color: AppColors.darkGrayColor
                              ),
                              secondStyle: AppStyles.smallerTextStyle,
                              secondText: AppString.priceString.tr+'${gxValues.orderDetails?.serviceTax??''}',
                            ),
                          ),
                          if((gxValues.appCharge?.gstPercentage??0)>0)SizeConfig.verticalSpaceSmall(),
                          if((gxValues.appCharge?.gstPercentage??0)>0)Padding(
                            padding: SizeConfig.sidePadding,
                            child: CustomListTileWidget(
                              firstText: AppString.gst.tr+' (${gxValues.appCharge?.gstPercentage}%)',
                              firstStyle: AppStyles.smallerTextStyle.copyWith(
                                  color: AppColors.darkGrayColor
                              ),
                              secondStyle: AppStyles.smallerTextStyle,
                              secondText:  AppString.priceString.tr+ '${gxValues.orderDetails?.tax??''}',
                            ),
                          ),
                          SizeConfig.verticalSpaceMedium(),
                          DotWidget(totalWidth: SizeConfig.screenWidth*.85,
                              dashWidth: 10, emptyWidth: 5, dashHeight: 1, dashColor: AppColors.darkGrayColor),
                          SizeConfig.verticalSpaceMedium(),
                          Padding(
                            padding:SizeConfig.sidePadding,
                            child: CustomListTileWidget(
                              firstText: AppString.grandTotal.tr+':',
                              secondText: AppString.priceString.tr+'${gxValues.orderDetails?.grandTotal??''}',
                              secondStyle: AppStyles.mediumTextStyle.copyWith(
                                  color: AppColors.red
                              ),
                            ),
                          ),
                          SizeConfig.verticalSpaceMedium(),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(
                              SizeConfig.screenWidth * .03),
                          boxShadow: SizeConfig.appShadow
                      ),
                    ),
                    SizeConfig.verticalSpace(SizeConfig.screenHeight*.1),
                  ],
                ),
              ),
              bottomNavigationBar: CustomBottomShowPriceButton(
                onTap: (){
                  AppGetService.navigateTo(Routes.ORDER_CHECK_OUT);

                },
                secondText: AppString.continueString.tr,
                firstText: AppString.grandTotal.tr+' : '+AppString.priceString.tr+'${gxValues.orderDetails?.grandTotal??''}',
              ),
            ),
          );
        });
  }
}
