import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/ResCustomerItemDetails/controllers/res_customer_item_details_controller.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_dialog_service.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_rating_dialog_widget.dart';
import 'package:hellowcity/app/shared/app_review_tile_widget.dart';
import 'package:hellowcity/app/shared/app_title_design.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';


class ItemReviewWidget extends StatelessWidget {
  ItemReviewWidget({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResCustomerItemDetailsController>(
        builder: (gxValues){
          return Padding(padding: SizeConfig.sidePadding,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.reviews.tr,
                      style: AppStyles.mediumTextStyle.copyWith(
                          color: AppColors.primaryColor, fontWeight: FontWeight.bold
                      ),),
                    TextButton(onPressed: () {
                    AppGetService.navigateTo(Routes.VIEW_ALL_REVIEW);
                    },
                        child: Text(AppString.viewAll.tr,
                          style: AppStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w800, color: AppColors.highlightColor
                          ),))
                  ],
                ),
                if(homeController.userDetails?.id != null)Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {
                      AppGetService.navigateTo(Routes.SUBMIT_PRODUCT_REVIEW);
                    },
                        child: Text(AppString.addReview.tr,
                          style: AppStyles.smallerTextStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.highlightColor
                          ),)),
                  ],
                ),
                CustomListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap:true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: gxValues.reviews.length>3?3:gxValues.reviews.length,
                    itemBuilder: (context, int index) {
                      return AppReviewTileWidget(review: gxValues.reviews[index]);
                    })
              ],
            ),);
        });
  }
}
