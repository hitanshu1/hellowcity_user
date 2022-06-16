import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/app_title_design.dart';
import 'package:hellowcity/app/shared/custom_horizontal_slider.dart';
import 'package:hellowcity/app/shared/custom_product_price_widget.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';
import 'package:hellowcity/app/shared/custom_under_line_header_text.dart';
import 'package:hellowcity/app/shared/empty_data_widget.dart';
import 'package:hellowcity/app/shared/restaurant/restaurant_offer_tile_widget.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';
import 'package:hellowcity/app/shared/view_product_list_tile.dart';

import '../controllers/restaurant_details_controller.dart';


class RestaurantDetailsView extends GetView<RestaurantDetailsController> {
  final StoreRestaurantModel restaurant;
  

  RestaurantDetailsView({required this.restaurant});

  final HomeController homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(
        didChangeDependencies: (val) {
          val.controller?.initializeData(restaurant);
        },
        builder: (gxValues) {
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor:  AppColors.whiteColor.withOpacity(.4),
                    expandedHeight: SizeConfig.screenHeight*.2,
                    floating: false,
                    pinned: true,
                    title: Text(restaurant.name??'',style: AppStyles.largeTextStyle.copyWith(
                      fontWeight: FontWeight.w700,color: AppColors.black
                    ),),
                    centerTitle: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: ViewAppImage(
                        imageUrl: restaurant.image,
                        emptyAssetUrl: AppAssets.restaurant,
                      ),
                    ),
                  ),
                  SizeConfig.verticalSliverSpaceSmall(),
                  if(gxValues.offerList.isNotEmpty)SliverToBoxAdapter(
                    child: Padding(
                      padding: SizeConfig.sidePadding,
                      child: CustomHorizontalSlider(
                        itemCount: gxValues.offerList.length,
                        itemBuilder: (context, int index, int lastIndex) {
                          return GestureDetector(
                            onTap: () {
                              if (gxValues.offerList[index].subtype ==
                                  ApiCheckingStings.itemOnly) {
                                AppGetService.navigateTo(
                                    Routes.RES_CUSTOMER_ITEM_DETAILS,
                                    argument: gxValues.offerList[index]
                                        .foodItem);
                              }
                            },
                            child: RestaurantOfferTileWidget(
                              offer: gxValues.offerList[index],
                            ),
                          );
                        },),
                    ),
                  ),
                  SizeConfig.verticalSliverSpaceSmall(),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: SizeConfig.sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomHeaderUnderLineText(
                            text: AppString.foodItemLists.tr,
                          ),
                          if(restaurant.type?.toLowerCase() ==
                              ApiCheckingStings.res &&
                              (restaurant.bookAvailable ?? false))TextButton(
                              onPressed: () {
                                if(homeController.userDetails?.id!=null){
                                  AppGetService.navigateTo(Routes.BOOK_CABIN);
                                }else{
                                  AppGetService.navigateTo(Routes.LOGIN_SCREEN);
                                }


                              }, child: Text(AppString.bookCabin.tr,
                            style: AppStyles.smallTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryColor),))
                        ],
                      ),
                    ),
                  ),
                  SizeConfig.verticalSliverSpaceSmall(),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: SizeConfig.sidePadding,
                      child: CustomTextFieldWidget(
                        height: SizeConfig.screenHeight * .06,
                        controller: gxValues.searchItemTextEditingController,
                        hintText: AppString.searchHere.tr,
                        suffixWidget: IconButton(
                            onPressed: () {
                              gxValues.onClearSearch();
                            }, icon: Icon(Icons.close)),
                        onChanged: (val) {
                          gxValues.update();
                        },

                      ),
                    ),
                  ),
                  SizeConfig.verticalSliverSpaceSmall(),
                  gxValues.productList.isNotEmpty?SliverPadding(
                    padding: SizeConfig.sidePadding,
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              ProductItemModel _product = gxValues
                                  .productList[index];
                              return Padding(
                                padding: SizeConfig.tilePadding,
                                child: ViewProductListTile(product: _product,isAvailable: gxValues.enableProducts,
                                  onTap: () {
                                    if(gxValues.enableProducts){
                                      AppGetService.navigateTo(
                                          Routes.RES_CUSTOMER_ITEM_DETAILS,
                                          argument: _product);
                                    }

                                  },),
                              );
                            },
                        childCount:gxValues.productList.length,
                      ),
                    ),
                  ):SliverToBoxAdapter(
                    child:  Padding(
                      padding: SizeConfig.sidePadding,
                      child: EmptyDataWidget(text: AppString.noProductFound
                          .tr,),
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
