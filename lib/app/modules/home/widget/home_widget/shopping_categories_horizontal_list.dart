import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/appdata.dart';
import 'package:hellowcity/app/data/enum/device_type.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/shared/view_category_tile_widget.dart';
import 'package:get/get.dart';
class ShoppingCategoriesHorizontalList extends StatelessWidget {
   ShoppingCategoriesHorizontalList({Key? key}) : super(key: key);

   final homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.smallTileHeight*1.2,
      child: ListView.builder(
          itemCount: AppData.shoppingList.length,scrollDirection: Axis.horizontal,
          itemBuilder: (context,int index){

            return Padding(
                padding:  EdgeInsets.only(right: index==AppData.shoppingList.length-1?0:10),
                child: ViewCategoryTileWidget(
                  category: AppData.shoppingList[index],
                  onTap: (){
                    homeController.homeWidgetFunctions.onClickCategory(AppData.shoppingList[index].name??'');
                  },));
          }),
    );
  }
}
