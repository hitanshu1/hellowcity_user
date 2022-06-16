import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/store_restaurant_order_model.dart';
import 'package:hellowcity/app/modules/SearchProductItem/views/search_product_item_view.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/number_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/app_title_design.dart';
import 'package:hellowcity/app/shared/app_title_tile_widget.dart';
import 'package:hellowcity/app/shared/app_title_widget.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/custom_focus_container.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';
import 'package:hellowcity/app/shared/price_with_quantity_text.dart';

import '../controllers/active_cabin_order_details_controller.dart';

class ActiveCabinOrderDetailsView
    extends GetView<ActiveCabinOrderDetailsController> {
  final StoreRestaurantOrderModel order;
  ActiveCabinOrderDetailsView({required this.order});

  Widget _productTile(
      {required ProductItemModel product}) {
    return AppTileDesign(
      child: ListTile(
        leading: Container(
            width: SizeConfig.screenWidth * .2,
            child: Text(product.name ?? '',
              style: AppStyles.smallTextStyle.copyWith(
                  fontWeight: FontWeight.w600
              ), maxLines: 2,)),
        title: PriceWithQuantityText(productItem: product,),

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActiveCabinOrderDetailsController>(
        didChangeDependencies: (val) {
          val.controller?.initializeData(order);
        },
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text('${order.storeRestaurant?.name??''}(${order.cabin?.name??''})'),
                centerTitle: true,
              ),
              body: Padding(
                padding: SizeConfig.sidePadding,
                child: CustomListView(
                  children: [
                    SizeConfig.verticalSpaceMedium(),

                  AppTitleTileWidget(
                    firstText: AppString.gst.tr,
                    secondText: '${order.storeRestaurant?.gstPercentage??'0'}%',
                  ),
                  SizeConfig.verticalSpaceSmall(),

                  CustomFocusContainer(

                      child: AppTitleTileWidget(
                        firstText: AppString.total.tr,
                        secondText: AppString.rupee +
                            NumberService.totalPriceWithTax(
                                gxValues.orderItemList,order.storeRestaurant?.gstPercentage),
                        secondTextStyle: AppStyles.smallTextStyle.copyWith(
                            color: AppColors.red,
                            fontWeight: FontWeight.w700,

                        ),
                      ),
                    ),
                   SizeConfig.verticalSpaceSmall(),
                    CustomButtonWidget(onPressed: () {
                      gxValues.searchProductItemController.onInit();
                      AppGetService.navigateTo(Routes.SEARCH_PRODUCT_ITEM,
                          argument: SearchProductItemArguments(
                              restaurant:order.storeRestaurant!), then: (val) {
                            gxValues.onSelectFoodItem();
                          });
                    },
                      buttonText: AppString.addFoodItem.tr,
                      width: 170,
                      fontSize: 15,
                      height: 40,
                      isBorderColor: true,) ,
                    SizeConfig.verticalSpaceSmall(),
                    AppTitleWidget(
                      title: AppString.foodItemLists.tr + ":",
                    ),
                    SizeConfig.verticalSpaceSmall(),
                    AppLoadingWidget(
                      isLoading: gxValues.isListLoading,
                      child: gxValues.orderItemList.isEmpty ? SizedBox(
                        height: SizeConfig.screenHeight * .2,
                      ) : CustomListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: gxValues.orderItemList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: SizeConfig.tilePadding,
                              child: _productTile(product: gxValues.orderItemList[index]),
                            );
                          }),
                    )

                  ],
                ),
              ),
            ),
          );
        });
  }
}
