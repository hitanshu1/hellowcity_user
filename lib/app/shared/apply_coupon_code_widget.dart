import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';

import 'custom_button_widget.dart';
import 'custom_textfield_widget.dart';

class ApplyCouponCodeWidget extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onApply;
   ApplyCouponCodeWidget({Key? key,this.controller,this.onApply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextFieldWidget(
          controller: controller,
          radius: 5,
          hintText: AppString.enterCouponCode.tr,
        )),
        SizeConfig.horizontalSpaceSmall(),
        CustomButtonWidget(
          height: 50,
          width: SizeConfig.screenWidth*.3,
          buttonText: AppString.apply.tr,
          onPressed: (){
            if(onApply!=null){
              onApply!();
            }

          },
        ),
      ],
    );
  }
}
