import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/modules/home/widget/wishlist/wish_list_tile_widget.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_gridview_widget.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/empty_data_widget.dart';

class WishListWidget extends StatelessWidget {
  const WishListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
     initState: (val){
       val.controller?.wishListFunctions.getWishList();
     },
        builder: (gxValues){
          return AppLoadingWidget(
              isLoading: gxValues.wishListFunctions.isLoading,
              child: gxValues.wishListFunctions.wishList.isNotEmpty?Padding(
                padding: SizeConfig.sidePadding,
                child: AppGridViewWidget(
                    itemBuilder: (context,int index){
                      return WishListTileWidget(
                        item:gxValues.wishListFunctions.wishList[index] ,
                        onTap: (){
                          AppGetService.navigateTo(Routes.RES_CUSTOMER_ITEM_DETAILS,
                          argument: gxValues.wishListFunctions.wishList[index]);
                        },
                        onDelete: (){
                          gxValues.wishListFunctions.onDeleteFromWishList(gxValues.wishListFunctions.wishList[index]);
                        },
                        onAddToCart: (){
                         gxValues.wishListFunctions.onClickAddToCart(gxValues.wishListFunctions.wishList[index]);
                        },
                      );
                    }, itemCount: gxValues.wishListFunctions.wishList.length),
              ):
              EmptyDataWidget(text: AppString.noProductFound.tr,));
        });
  }
}
