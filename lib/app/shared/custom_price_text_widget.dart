import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/text_style.dart';


class CustomPriceTextWidget extends StatelessWidget {
  final String? sellingPrice,mrPrice;
  CustomPriceTextWidget({Key? key,this.mrPrice,this.sellingPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppString.priceString.tr+(sellingPrice??''),
        style: AppStyles.largeTextStyle.copyWith(
          color: AppColors.primaryColor,fontWeight: FontWeight.w800
        ),
        children:  <TextSpan>[
         if( mrPrice!=null)TextSpan(text: AppString.priceString.tr+(mrPrice??''),
              style:AppStyles.largeTextStyle.copyWith(
                color: AppColors.darkGrayColor,decoration: TextDecoration.lineThrough
              )),
        ],
      ),
    );
  }
}
