import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/app_title_design.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';

import '../controllers/search_cabin_controller.dart';

class SearchCabinView extends GetView<SearchCabinController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchCabinController>(

        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
                appBar: AppBar(
                  title: Text(AppString.pleaseSelectCabin.tr),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    SizeConfig.verticalSpaceSmall(),
                    Padding(
                      padding: SizeConfig.sidePadding,
                      child: CustomTextFieldWidget(
                        height: SizeConfig.screenHeight*.06,
                        controller: gxValues.searchCabinController,
                        hintText: AppString.searchHere.tr,
                        onChanged: (val){
                          gxValues.update();
                        },

                      ),
                    ),
                    SizeConfig.verticalSpaceSmall(),
                    Expanded(
                      child: Padding(
                        padding: SizeConfig.sidePadding,
                        child: CustomListView.builder(
                            itemCount: gxValues.cabinList.length,itemBuilder: (context,int index){
                          return Padding(
                            padding: SizeConfig.tilePadding,
                            child: GestureDetector(
                              onTap: (){
                                gxValues.onSelectCabin(gxValues.cabinList[index]);
                              },
                              child:AppTileDesign(
                                child: Padding(
                                  padding: SizeConfig.padding,
                                  child:ListTile(
                                    title:  Text(gxValues.cabinList[index].name??'',
                                      style: AppStyles.smallTextStyle.copyWith(
                                          color: AppColors.blueColor,fontWeight: FontWeight.w800
                                      ),),
                                    trailing: Text(AppString.status.tr+': '+(gxValues.cabinList[index].status??''),
                                        style: AppStyles.smallerTextStyle.copyWith(
                                            color: AppColors.cabinStatusColor(gxValues.cabinList[index].status),fontWeight: FontWeight.w700
                                        )),
                                    subtitle:  Text(AppString.type.tr+': '+(gxValues.cabinList[index].type??''),
                                      style: AppStyles.smallerTextStyle.copyWith(
                                          color: AppColors.green,fontWeight: FontWeight.w700
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                )
            ),
          );
        });
  }
}
