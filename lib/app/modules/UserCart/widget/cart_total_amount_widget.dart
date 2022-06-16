import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/shared/custom_bottom_show_price_button.dart';



class CartTotalAmountWidget extends StatelessWidget {
  final String totalAmount;
  final Function onTap;
  CartTotalAmountWidget({Key? key,required this.onTap,required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomShowPriceButton(
      onTap: (){
        onTap();
      },
      firstText: AppString.subTotal.tr+' : '+AppString.priceString.tr+totalAmount,
      secondText: AppString.proceed.tr,
    );
  }
}
