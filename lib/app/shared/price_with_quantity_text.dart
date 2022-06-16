import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/services/number_service.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/text_style.dart';


class PriceWithQuantityText extends StatelessWidget {
  final ProductItemModel productItem;
  const PriceWithQuantityText({Key? key,required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "${productItem.quantity} x"+AppString.rupee.tr+NumberService.getProductSinglePrice(productItem),
        style: AppStyles.smallTextStyle.copyWith(
          color: AppColors.darkGrayColor,fontWeight: FontWeight.w600
        ),
        children:  <TextSpan>[
          TextSpan(text: '=', style: AppStyles.smallTextStyle.copyWith(
            color: AppColors.black,fontWeight: FontWeight.w700
          )),
          TextSpan(text: AppString.rupee.tr+NumberService.getProductPrice(productItem),
          style: AppStyles.mediumTextStyle.copyWith(
            fontWeight: FontWeight.bold,color: AppColors.primaryColor
          )),
        ],
      ),
    );

  }
}
