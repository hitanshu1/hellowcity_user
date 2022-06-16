import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/appdata.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_gridview_widget.dart';
import 'package:hellowcity/app/shared/custom_tile_with_description.dart';

import '../controllers/view_all_shopping_category_controller.dart';

class ViewAllShoppingCategoryView
    extends GetView<ViewAllShoppingCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.shopping.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: SizeConfig.padding.copyWith(
          top: SizeConfig.screenHeight*.02
        ),
        child: AppGridViewWidget(
            itemBuilder: (context,int index){
              return CustomTileWithDescription(
                onTap: (){
                  if(AppData.shoppingList[index].name==AppString.stores.tr){
                    AppGetService.navigateTo(Routes.STORE_RESTAURANT_LIST,argument: ApiCheckingStings.store);
                  }else if(AppData.shoppingList[index].name==AppString.restaurantDhaba.tr){
                    AppGetService.navigateTo(Routes.STORE_RESTAURANT_LIST,argument: ApiCheckingStings.res);
                  }else if(AppData.shoppingList[index].name==AppString.allProducts.tr){
                    AppGetService.navigateTo(Routes.ALL_PRODUCTS);
                  }
                },
                title: AppData.shoppingList[index].name,
                emptyAsset: AppData.shoppingList[index].imageUrl,
              );
            },
            itemCount: AppData.shoppingList.length),
      ),
    );
  }
}
