import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/services/number_format_service.dart';
import 'package:hellowcity/app/services/number_service.dart';

class CustomProductPriceWidget extends StatelessWidget {
  final ProductItemModel product;
  const CustomProductPriceWidget({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: product.offer!=null?'':AppString.priceString.tr+NumberFormatService.convertNumber(product.price??''),
        style:AppStyles.smallerTextStyle.copyWith(
            color: AppColors.primaryColor,fontWeight: FontWeight.w700
        ),
        children:  <TextSpan>[
          if(product.offer!=null)TextSpan(text: AppString.priceString.tr+NumberFormatService.convertNumber(product.price??'')+' ',
              style: AppStyles.smallerTextStyle.copyWith(
              color: AppColors.red,fontWeight: FontWeight.w700,decoration: TextDecoration.lineThrough
          )),
          if(product.offer!=null)TextSpan(text: AppString.priceString.tr+NumberService.getPriceAfterDiscount(product.price,
                product.offer?.discount),
            style: AppStyles.smallerTextStyle.copyWith(
                color: AppColors.primaryColor,fontWeight: FontWeight.w700
            ),),
        ],
      ),
    );
  }
}
