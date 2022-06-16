import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/services/app_dialog_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';
import 'package:hellowcity/app/shared/delete_confirmation_dialog.dart';
import 'package:hellowcity/app/shared/product_with_selectable_quantity.dart';

import '../controllers/search_product_item_controller.dart';
class SearchProductItemArguments{
  final StoreRestaurantModel restaurant;
  final bool showQuantity;
  SearchProductItemArguments({required this.restaurant,this.showQuantity:true});
}
class SearchProductItemView extends GetView<SearchProductItemController> {
  final SearchProductItemArguments arguments;
  SearchProductItemView({required this.arguments});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchProductItemController>(
        didChangeDependencies: (val){
          val.controller?.initializeData(arguments.restaurant.id?.toString()??'');
        },
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.selectFoodItem.tr,),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  SizeConfig.verticalSpaceSmall(),

                  Padding(
                    padding: SizeConfig.sidePadding,
                    child: CustomTextFieldWidget(
                      height: SizeConfig.screenHeight*.06,
                      controller: gxValues.searchItemTextEditingController,
                      hintText: AppString.searchHere.tr,
                      onChanged: (val){
                        gxValues.update();
                      },

                    ),
                  ),
                  SizeConfig.verticalSpaceSmall(),
                  Expanded(
                    child: Padding(
                      padding: SizeConfig.sidePadding,
                      child: CustomListView.builder(
                          itemCount: gxValues.productList.length,itemBuilder: (context,int index){
                        return Padding(
                          padding: SizeConfig.tilePadding,
                          child: Stack(
                            children: [
                              ProductWithSelectableQuantity(
                                available:gxValues.productList[index].available??true,
                                item: gxValues.productList[index],
                                showQuantity: arguments.showQuantity,
                                onIncreaseQuantity: (){
                                  gxValues.onIncreaseProduct(gxValues.productList[index]);
                                },
                                onDecreaseQuantity: (){
                                  gxValues.onDecreaseProduct(gxValues.productList[index]);
                                },
                              ),
                              Positioned.fill(child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(icon: Icon(Icons.control_point),
                                  onPressed: (){
                                    AppDialogService.showAppDialog(DeleteConfirmationDialog(
                                      title: AppString.doYourReallyWantToAdd.tr,
                                      onConFirmed: (){
                                        gxValues.onSelectedFood(gxValues.productList[index]);
                                      },
                                    ),);

                                  },),
                              ))
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
