import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/hellow_city_icon.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';

class HomeNavigationBar extends StatelessWidget {
  HomeNavigationBar({Key? key}) : super(key: key);

  final homeController= Get.put(HomeController());



  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      // backgroundColor: AppColors.green.withOpacity(.5),
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(HellowCityIcons.home),
          label: AppString.home.tr,
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(HellowCityIcons.money),
        //   label: AppString.bidWork.tr,
        // ),
        BottomNavigationBarItem(
          icon: Icon(HellowCityIcons.heart),
          label: AppString.wishList.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(HellowCityIcons.user_1),
          label: AppString.profile.tr,
        ),
      ],
      currentIndex: homeController.index,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.darkGrayLittleColor,
      unselectedLabelStyle: TextStyle(color: AppColors.black),
      selectedLabelStyle: TextStyle(color: AppColors.primaryColor),
      showUnselectedLabels: true,
      onTap: (int val){
        homeController.onChangeIndex(val);
      },

    );
  }
}
