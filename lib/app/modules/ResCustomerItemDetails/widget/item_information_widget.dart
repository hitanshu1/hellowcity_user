import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/ResCustomerItemDetails/controllers/res_customer_item_details_controller.dart';
import 'package:hellowcity/app/services/app_dialog_service.dart';
import 'package:hellowcity/app/shared/app_rating_dialog_widget.dart';
import 'package:hellowcity/app/shared/custom_price_text_widget.dart';
import 'package:hellowcity/app/shared/custom_quantity_widget.dart';
import 'package:hellowcity/app/shared/custom_rating_widget.dart';

class ItemInformationWidget extends StatelessWidget {
  ItemInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResCustomerItemDetailsController>(
      builder: (gxValues){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizeConfig.verticalSpaceMedium(),
            Padding( padding: SizeConfig.sidePadding,
            child: Row(
              children: [
                Expanded(
                  child: Text(gxValues.foodItem?.name??'',
                  style: AppStyles.mediumTextStyle.copyWith(
                    fontWeight: FontWeight.bold
                  ),),
                ),
                CustomRatingWidget(initialRating: gxValues.foodItem?.rating??0, enable: false  ,)
              ],
            ),),
            Padding(
              padding: SizeConfig.sidePadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(gxValues.foodItem?.category??'',
                    style: AppStyles.largeTextStyle.copyWith(
                        fontWeight: FontWeight.normal,color: AppColors.darkGrayColor
                    ),),
                  if(gxValues.homeController.userDetails?.id!=null)TextButton(onPressed: (){
                    AppDialogService.showAppDialog(AppRatingDialogWidget(
                      initialRating: gxValues.foodItem?.rating??0,
                      onSubmitRating: (val){
                        gxValues.onSubmitRating(val);
                      },
                    ));
                  },
                      child: Text(AppString.rateNow.tr,style: AppStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.bold,color: AppColors.green
                      ),)),
                ],
              ),
            ),
            Padding(
              padding: SizeConfig.sidePadding,
              child: CustomPriceTextWidget(
                sellingPrice: gxValues.foodItem?.price,
              ),
            ),
            SizeConfig.verticalSpaceMedium(),
            Padding(
              padding:SizeConfig.sidePadding,
              child: Text(AppString.description.tr+':',style: AppStyles.smallTextStyle.copyWith(
                color: AppColors.black
              ),),
            ),
            SizeConfig.verticalSpaceSmall(),

            Padding(
              padding: SizeConfig.sidePadding,
              child: Text(gxValues.foodItem?.description??'',style: AppStyles.smallerTextStyle.copyWith(
                color: AppColors.darkGrayColor
              ),),
            ),
            if(gxValues.foodItem?.deliveryStatus??false)SizeConfig.verticalSpaceMedium(),
            if(gxValues.foodItem?.deliveryStatus??false)Padding(
              padding: SizeConfig.sidePadding,
              child: Row(
                children: [
                  Expanded(child: Text(AppString.quantity.tr+':',style: AppStyles.mediumTextStyle.copyWith(
                      color: AppColors.black
                  ),),),
                  CustomQuantityWidget(quantity: gxValues.quantity,
                  onDecrease: gxValues.decreaseQuantity,onIncrease: gxValues.inCreaseQuantity,),
                ],
              ),
            ),
            // Padding(
            //   padding:SizeConfig.sidePadding,
            //   child: Text(AppString.note,style: AppStyles.smallTextStyle,),
            // ),
            // SizeConfig.verticalSpaceSmall(),
            // Padding(
            //   padding: SizeConfig.sidePadding,
            //   child: Text('${}',style: AppStyles.smallerGrayTextStyle,),
            // )
          ],
        );
      },
    );
  }
}
