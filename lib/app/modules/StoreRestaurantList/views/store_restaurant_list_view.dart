import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_back_button.dart';
import 'package:hellowcity/app/shared/app_gridview_widget.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_tile_with_description.dart';
import 'package:hellowcity/app/shared/empty_data_widget.dart';

import '../controllers/store_restaurant_list_controller.dart';

class StoreRestaurantListView extends GetView<StoreRestaurantListController> {
  final  String type;
  StoreRestaurantListView({required this.type});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreRestaurantListController>(
      didChangeDependencies: (val){
        val.controller?.onFetchStoreRestaurantApi(type);
      },
      builder: (gxValues){
        return AppLoadingWidget(
          isLoading: gxValues.isLoading,
          child: Scaffold(
              appBar: AppBar(
                leading: AppBackButton(),
                title: Text(type==ApiCheckingStings.res?AppString.restaurantDhaba.tr:
                AppString.stores.tr),
                centerTitle: true,
              ),
              body: Padding(
                padding: SizeConfig.padding.copyWith(
                    bottom: SizeConfig.screenHeight*.2
                ),
                child: gxValues.restaurantList.isNotEmpty?AppGridViewWidget(

                    itemCount: gxValues.restaurantList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return CustomTileWithDescription(
                        onTap: (){
                          AppGetService.navigateTo(Routes.RESTAURANT_DETAILS,
                              argument:gxValues.restaurantList[index] );
                        },
                        title: gxValues.restaurantList[index].name,
                        imageUrl: gxValues.restaurantList[index].image,
                        emptyAsset: AppAssets.restaurant,
                      );

                    }):EmptyDataWidget(text: type==ApiCheckingStings.res?AppString.noRestaurantFound.tr:
                AppString.noStoreFound.tr,),
              )
          ),
        );
      },
    );
  }
}
