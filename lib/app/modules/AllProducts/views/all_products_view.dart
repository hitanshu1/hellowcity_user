import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_date_service.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';
import 'package:hellowcity/app/shared/custom_two_option_tab.dart';
import 'package:hellowcity/app/shared/empty_data_widget.dart';
import 'package:hellowcity/app/shared/view_product_list_tile.dart';

import '../controllers/all_products_controller.dart';

class AllProductsView extends GetView<AllProductsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllProductsController>(
        builder: (gxValues){
          return Scaffold(
            appBar: AppBar(
              title: Text(AppString.allProducts.tr),
              centerTitle: true,
            ),
            body:Padding(
              padding: SizeConfig.padding,
              child: Column(
                children: [
                  CustomTwoOptionWidget(onChanged: (val){
                    gxValues.onChangeTabValue(val);
                  },
                      value: gxValues.showStore,
                      secondText: AppString.store.tr, firstText: AppString.restaurant.tr),
                  SizeConfig.verticalSpaceSmall(),
                  CustomTextFieldWidget(
                    hintText: AppString.searchHere.tr,
                    onChanged: (val){
                      gxValues.onSearchText(val);
                    },
                  ),
                  SizeConfig.verticalSpaceMedium(),
                  Expanded(child: AppLoadingWidget(
                    isLoading: gxValues.isLoading,
                    child: gxValues.products.length>0?CustomListView.builder(
                      itemCount: gxValues.products.length,
                        itemBuilder: (context,int index){
                          return Padding(
                            padding: SizeConfig.tilePadding,
                            child: Banner(
                              location: BannerLocation.topStart,

                              message: gxValues.products[index].storeRestaurant?.name??'',
                              child: ViewProductListTile(
                                onTap: () {
                                  if(AppDateService.checkStoreResProductAvailability(gxValues.products[index].storeRestaurant?.timeTable)){
                                    AppGetService.navigateTo(
                                        Routes.RES_CUSTOMER_ITEM_DETAILS,
                                        argument: gxValues.products[index]);
                                  }

                                },
                                product: gxValues.products[index],
                              isAvailable: AppDateService.checkStoreResProductAvailability(gxValues.products[index].storeRestaurant?.timeTable),),
                            ),
                          );
                        }):EmptyDataWidget(text: AppString.noProductFound.tr,),
                  ))

                ],
              ),
            ),
          );
        });
  }
}
