import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/home/widget/bidwork/bid_work_widget.dart';
import 'package:hellowcity/app/modules/home/widget/home_widget/home_widget.dart';
import 'package:hellowcity/app/modules/home/widget/home_navigation_bar.dart';
import 'package:hellowcity/app/modules/home/widget/profile/profile_widget.dart';
import 'package:hellowcity/app/modules/home/widget/wishlist/wish_list_widget.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_drawer_widget.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/no_internet_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  Widget _body(int index){
    if(index==1){
      return WishListWidget();
    }else if(index==2){
      return ProfileWidget();
    }
    // else if(index==3){
    //   return ProfileWidget();
    // }
    return HomeWidget();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.sizeConfigInit(context);
    return GetBuilder<HomeController>(
        builder: (gxValues){
          if(!gxValues.isInterNetAvailable){
            return NoInterNetWidget();
          }
          if(gxValues.updateAvailable){
            return Scaffold(
              body: Center(
                child: TextButton(
                  child: Text('Please update your app',
                    style: AppStyles.mediumTextStyle.copyWith(
                        color: AppColors.primaryColor,fontWeight: FontWeight.w700
                    ),),
                  onPressed: (){

                  },
                ),
              ),
            );
          }
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              drawer: AppDrawerWidget(),
              appBar: AppBar(
                centerTitle: false,
                elevation: 0,
                // automaticallyImplyLeading: false,
                title:  Padding(
                  padding: SizeConfig.innerSidePadding.copyWith(
                      left: 0
                  ),
                  child: InkWell(
                    onTap: (){
                      if(gxValues.userDetails?.id!=null){
                        AppGetService.navigateTo(Routes.ADD_OR_CHANGE_DELIVERY_ADDRESS);
                      }else{
                        AppGetService.navigateTo(Routes.ENTER_LOCATION);
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('${AppString.yourLocation.tr} :',style: AppStyles.mediumTextStyle.copyWith(
                                color: AppColors.darkGrayColor
                            ),),
                            SizeConfig.horizontalSpaceSmall(),
                            Icon(Icons.edit,size: SizeConfig.fontSizeMedium,)
                          ],
                        ),
                        Text(gxValues.userAddress?.city??'',style: AppStyles.smallTextStyle.copyWith(
                            color: AppColors.green
                        ),)
                      ],
                    ),
                  ),
                ),
                actions: [
                  IconButton(onPressed: (){
                    AppGetService.navigateTo(Routes.USER_CART);
                  }, icon: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.shopping_cart,color: AppColors.primaryColor,),
                      ),
                      if(gxValues.cartList.isNotEmpty)Positioned.fill(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.red,
                                  shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text('${gxValues.cartList.length}'),
                              ),
                            ),
                          ))
                    ],
                  )),
                  IconButton(onPressed: (){
                    gxValues.onQRViewCreated();
                  }, icon: Icon(Icons.qr_code,color: AppColors.primaryColor))
                ],
              ),
              body:_body(gxValues.index),
              bottomNavigationBar: HomeNavigationBar(),
            ),
          );
        });
  }
}
