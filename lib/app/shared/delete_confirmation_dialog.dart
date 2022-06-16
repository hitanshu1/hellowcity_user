import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/services/app_get_service.dart';

import 'custom_button_widget.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final Function onConFirmed;
  final String? title;
  const DeleteConfirmationDialog({Key? key,required this.onConFirmed,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title??AppString.doYouReallyWantToDelete.tr, style: AppStyles.smallTextStyle.copyWith(
        color: AppColors.primaryColor,fontWeight: FontWeight.bold
      )),
      backgroundColor: Theme.of(context).cardColor,
      actions: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: CustomButtonWidget(width: SizeConfig.screenWidth*.3,onPressed: (){
            AppGetService.back();
          },buttonText: AppString.CANCEL.tr,),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: CustomButtonWidget(width: SizeConfig.screenWidth*.3,onPressed: (){
            onConFirmed();

            AppGetService.back();
          },buttonText: AppString.YES.tr,),
        )
      ],
    );
  }
}
