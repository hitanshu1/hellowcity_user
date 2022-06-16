import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/product_review.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';

import 'app_title_design.dart';

class AppReviewTileWidget extends StatelessWidget {
 final ProductReview review;
   AppReviewTileWidget({Key? key,required this.review}) : super(key: key);

  final HomeController homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return AppTileDesign(
      child: Padding(
        padding: SizeConfig.smallPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review.title??'',
              style: AppStyles.smallerTextStyle.copyWith(
                fontWeight: FontWeight.w700,
              ),),
            Text(review.description??'',
              style: AppStyles.smallerTextStyle.copyWith(
              ),),
            Row(
              children: [
                Expanded(
                  child: Text(AppString.name.tr+": "+((review.reviewUser?.name??review.reviewUser?.phoneNumber)??''),
                    style: AppStyles.smallerTextStyle.copyWith(
                        color: AppColors.highlightColor
                    ),),
                ),
                if(review.reviewUser?.id==homeController.userDetails?.id)TextButton(onPressed: (){
                  AppGetService.navigateTo(Routes.SUBMIT_PRODUCT_REVIEW,
                      argument:review);

                }, child: Text(AppString.edit.tr,style: AppStyles.smallerTextStyle.copyWith(
                    color: AppColors.highlightColor
                ),)),
              ],
            )

          ],
        ),
      ),
    );
  }
}
