import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/app_title_tile_widget.dart';
import 'package:hellowcity/app/shared/custom_horizontal_slider.dart';
import 'package:hellowcity/app/shared/empty_offer_widget.dart';
import 'package:hellowcity/app/shared/restaurant/restaurant_offer_tile_widget.dart';

import 'shopping_categories_horizontal_list.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (gxValues){
          return AppLoadingWidget(
            child: SingleChildScrollView(
              child: Padding(
                padding: SizeConfig.padding,
                child: Column(
                  children: [
                    SizeConfig.verticalSpaceSmall(),
                    gxValues.homeWidgetFunctions.offerList.length>0?CustomHorizontalSlider(
                      itemCount: gxValues.homeWidgetFunctions.offerList.length,
                      itemBuilder:  (context,int index,int lastIndex) {

                        return GestureDetector(
                          onTap: (){
                            if(gxValues.homeWidgetFunctions.offerList[index].subtype==ApiCheckingStings.itemOnly){
                              AppGetService.navigateTo(Routes.RES_CUSTOMER_ITEM_DETAILS,
                                  argument: gxValues.homeWidgetFunctions.offerList[index].foodItem);

                            }else{
                              AppGetService.navigateTo(Routes.RESTAURANT_DETAILS,
                              argument: gxValues.homeWidgetFunctions.offerList[index].restaurant);
                            }
                          },
                          child: RestaurantOfferTileWidget(
                            offer: gxValues.homeWidgetFunctions.offerList[index],
                          ),
                        );
                      },):CustomHorizontalSlider(
                        itemBuilder:  (context, index,int lastIndex) {
                          return EmptyOfferWidget();
                        },
                        itemCount: 2),
                    SizeConfig.verticalSpaceMedium(),
                    AppTitleTileWidget(
                      firstText: AppString.shopping.tr,
                      firstTextStyle: AppStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.w700,color: AppColors.highlightColor
                      ),
                      secondTextStyle: AppStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.w600
                      ),
                      secondText: AppString.viewAll.tr,
                      onClickSecondOption: (){
                        AppGetService.navigateTo(Routes.VIEW_ALL_SHOPPING_CATEGORY);

                      },
                    ),
                    SizeConfig.verticalSpaceSmall(),
                    ShoppingCategoriesHorizontalList(),
                    SizeConfig.verticalSpaceMedium(),
                    // AppTitleTileWidget(
                    //   firstText: AppString.services,
                    //   secondText: AppString.viewAll,
                    //   onClickSecondOption: (){
                    //     // Navigator.of(context).pushNamed(ViewAllServiceScreen.routeName);
                    //   },
                    // ),
                    // SizeConfig.verticalSpaceSmall(),
                    // ServicesHorizontalList(),
                    SizeConfig.verticalSpaceLarge(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
