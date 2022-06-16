import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/shared/app_back_button.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';

import '../controllers/enter_location_controller.dart';

class EnterLocationView extends GetView<EnterLocationController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnterLocationController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                leading: Navigator.canPop(context)?AppBackButton():
                Container(height: 0,width: 0,),
                title: Text(AppString.enterLocation.tr,),
                centerTitle: true,
              ),
              body: Padding(
                padding: SizeConfig.padding,
                child: ListView(
                  children: [
                    SizeConfig.verticalSpaceLarge(),
                    CustomTextFieldWidget(
                      controller: gxValues.yourNameController,
                      hintText: AppString.yourName.tr,
                      keyboardType: TextInputType.text,
                      focusNode: gxValues.nameFocusNode,
                      nextFocusNode: gxValues.cityFocusNode,
                    ),
                    SizeConfig.verticalSpaceMedium(),
                    CustomTextFieldWidget(
                      controller: gxValues.cityController,
                      hintText: AppString.city.tr,
                      keyboardType: TextInputType.text,
                      focusNode: gxValues.cityFocusNode,
                      nextFocusNode: gxValues.pinCodeNode,
                    ),
                    SizeConfig.verticalSpaceMedium(),
                    CustomTextFieldWidget(
                      focusNode:  gxValues.pinCodeNode,
                      controller: gxValues.pinCodeController,
                      hintText: AppString.pincode.tr,
                      keyboardType: TextInputType.number,
                      onSubmit: (val){
                        gxValues.getAddressFromPinCode(val, context);
                      },
                      onChanged: (val){
                        if(val.length==6){
                          gxValues.getAddressFromPinCode(val, context);
                        }
                      },
                    ),
                    SizeConfig.verticalSpaceMedium(),
                    CustomButtonWidget(buttonText: AppString.proceed.tr, onPressed: (){
                      gxValues.onProceed();
                    },radius: SizeConfig.borderRadius,)
                  ],
                ),
              ),
            ),
          );
        });

  }
}
