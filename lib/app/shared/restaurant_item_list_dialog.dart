import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';

import 'app_dialog_shape.dart';

class RestaurantItemListDialog extends StatelessWidget {
  const RestaurantItemListDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDialogShape(
      child: Padding(
        padding: SizeConfig.sidePadding,
        child: Column(
          children: [
            SizeConfig.verticalSpaceMedium(),
            CustomTextFieldWidget(
              hintText: AppString.itemName.tr,

            ),
            SizeConfig.verticalSpaceMedium(),

            Expanded(child: ListView.builder(
              itemCount: 50,
                itemBuilder: (context,int index){
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGrayLittleColor,
                      width: 2),
                      borderRadius: BorderRadius.circular(5)
                    ),
                      child:ListTile(
                        leading: Text('ItemName'),
                        trailing: Text('200'),
                      ) );
                })),
            SizeConfig.verticalSpaceMedium(),
          ],
        ),
      ),


    );
  }
}
