import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/customer_order_model.dart';
import 'package:hellowcity/app/shared/custom_list_tile_widget.dart';
import 'package:hellowcity/app/shared/dot_widget.dart';


class ViewCartItemByStoreResTile extends StatelessWidget {
  final StoreResWithProductItem storeResWithProductItem;
   ViewCartItemByStoreResTile({Key? key,required this.storeResWithProductItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: SizeConfig.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(storeResWithProductItem.storeRestaurant?.name?.toUpperCase()??'',
            style: AppStyles.smallTextStyle.copyWith(
              fontWeight: FontWeight.w700
            ),),
            SizeConfig.verticalSpaceSmall(),
            ListView.builder(
                shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                itemCount: storeResWithProductItem.itemList?.length??0,
                itemBuilder: (context,int index){
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( storeResWithProductItem.itemList?[index].name??'',
                        style: AppStyles.smallerTextStyle.copyWith(
                          fontWeight: FontWeight.w500,color: AppColors.primaryColor
                        ),),
                        CustomListTileWidget(
                          firstText: AppString.priceString.tr+'${storeResWithProductItem.itemList?[index].price??''} X '+'${storeResWithProductItem.itemList?[index].quantity}',
                          firstStyle: AppStyles.smallerTextStyle.copyWith(
                            color: AppColors.darkGrayColor
                          ),
                          secondStyle: AppStyles.smallerTextStyle,
                          secondText: AppString.priceString.tr+'${(int.parse(storeResWithProductItem.itemList?[index].price??'')*storeResWithProductItem.itemList![index].quantity)}',
                        ),
                      ],
                    ),
                  );
                }),
            SizeConfig.verticalSpace(4),
            Center(
              child: DotWidget(totalWidth: SizeConfig.screenWidth*.84,
                  dashWidth: 10, emptyWidth: 5, dashHeight: 1, dashColor: AppColors.darkGrayColor),
            ),
            SizeConfig.verticalSpaceSmall(),
            // if(PriceCalculatorService.totalPriceFromCartItem
            //   (cartItemByStoreRes.cartItems)<AppConstants.freeDeliveryAmount) CustomListTileWidget(
            //   firstText: AppString.deliveryCharge,
            //   firstStyle: AppStyles.smallTextStyle.copyWith(
            //       color: AppColors.darkGrayColor
            //   ),
            //   secondStyle: AppStyles.smallTextStyle,
            //   secondText: AppString.priceString+'${AppConstants.deliveryCharge}',
            // ),
            // if(PriceCalculatorService.totalPriceFromCartItem
            //   (cartItemByStoreRes.cartItems)<300)SizeConfig.verticalSpaceSmall(),
            //   CustomListTileWidget(
            //   firstText: AppString.total+':',
            //   secondText: AppString.priceString+'${PriceCalculatorService.totalPriceFromCartItemWithDeliveryCharge
            //     (cartItemByStoreRes.cartItems)}',
            //   secondStyle: AppStyles.mediumTextStyle.copyWith(
            //     color: AppColors.red.withOpacity(.7)
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
