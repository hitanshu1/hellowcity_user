import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/address_model.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/app_validation_service.dart';
import 'package:hellowcity/app/shared/app_back_button.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';
import 'package:hellowcity/app/shared/user_address_tile_widget.dart';

import '../controllers/add_or_change_delivery_address_controller.dart';

class AddOrChangeDeliveryAddressView extends GetView<AddOrChangeDeliveryAddressController> {
  final AddressModel? selectedAddress;
  AddOrChangeDeliveryAddressView({this.selectedAddress});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddOrChangeDeliveryAddressController>(
        didChangeDependencies: (val){
          val.controller?.initializeData(selectedAddress);
        },
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                leading: AppBackButton(
                  onPressed: (){
                    if(!gxValues.showAddressList){
                      gxValues.onChangeView(true);
                    }else{
                      AppGetService.back();
                    }
                  },
                ),
                title: Text(AppString.addAddress.tr),
              ),
              body:gxValues.showAddressList?Padding(
                padding:SizeConfig.sidePadding,
                child: Column(
                  children: [
                    SizeConfig.verticalSpaceMedium(),
                    CustomButtonWidget(onPressed: (){
                      gxValues.onChangeView(false);
                      gxValues.clearAll();
                    },
                      gradient: AppColors.primaryLinearGradient,
                      buttonText: AppString.addAddress.tr,),
                    SizeConfig.verticalSpaceMedium(),
                    Expanded(child: ListView.builder(
                        itemCount: gxValues.addressList.length,
                        itemBuilder: (context,int index){
                          return Padding(
                            padding: SizeConfig.tilePadding,
                            child: UserAddressTileWidget(address: gxValues.addressList[index],
                              onTap: (){
                                gxValues.onSetAsDefault(gxValues.addressList[index]);
                              },
                              onEdit: (){
                                gxValues.initializeData(gxValues.addressList[index]);
                              },
                            ),
                          );
                        }))
                  ],
                ),
              ):
              Padding(
                padding: SizeConfig.padding,
                child: Form(
                  key: gxValues.formKey,
                  child: ListView(
                    children: [
                      SizeConfig.verticalSpaceMedium(),
                      CustomTextFieldWidget(
                        autoValidation: gxValues.autoValidation,
                        controller: gxValues.nameController,
                        hintText: AppString.name.tr,
                        validator: (val)=>AppValidationService.stringValidator(val, AppString.name.tr),
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      CustomTextFieldWidget(
                        autoValidation: gxValues.autoValidation,
                        controller: gxValues.phoneNumberController,
                        hintText: AppString.phone.tr,
                        keyboardType: TextInputType.phone,
                        validator: (val)=>AppValidationService.stringValidator(val, AppString.phone.tr),
                      ),
                      // SizeConfig.verticalSpaceSmall(),
                      // CustomTextFieldWidget(
                      //   controller: model.houseNumberController,
                      //   hintText: AppString.housenumber,
                      // ),
                      SizeConfig.verticalSpaceSmall(),
                      CustomTextFieldWidget(
                        autoValidation: gxValues.autoValidation,
                        controller: gxValues.address1Controller,
                        maxLines: 2,
                        hintText: AppString.addressLine1.tr,
                        validator: (val)=>AppValidationService.stringValidator(val, AppString.addressLine1.tr),
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      CustomTextFieldWidget(
                        controller: gxValues.landMarkController,
                        maxLines: 2,
                        hintText: AppString.addressLine2.tr,
                      ),
                      SizeConfig.verticalSpaceSmall(
                      ),
                      CustomTextFieldWidget(
                        autoValidation: gxValues.autoValidation,
                        controller: gxValues.pinCodeController,
                        hintText: AppString.pincode.tr,
                        keyboardType: TextInputType.number,
                        validator: (val)=>AppValidationService.stringValidator(val, AppString.pincode.tr),
                        onChanged: (String val){
                          if(val.length==6){
                            FocusScope.of(context).requestFocus(FocusNode());
                            gxValues.getAddressFromPinCode(val, context);
                          }

                        },
                        onSubmit:  (val){
                          FocusScope.of(context).requestFocus(FocusNode());
                          gxValues.getAddressFromPinCode(val, context);
                        },
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      CustomTextFieldWidget(
                        controller: gxValues.cityController,
                        enabled: false,
                        hintText: AppString.city.tr,
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      CustomTextFieldWidget(
                        controller: gxValues.stateController,
                        enabled: false,
                        hintText: AppString.state.tr,
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      CustomTextFieldWidget(
                        controller: gxValues.countryController,
                        enabled: false,
                        hintText: AppString.country.tr,
                      ),
                      CheckboxListTile(value: gxValues.isDefault,

                        onChanged: (bool? val){
                          if(val!=null)
                            gxValues.onChangeDefault(val);
                        },title: Text(AppString.setAsDefaultAddress.tr,
                          style: AppStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w700
                          ),),),
                      SizeConfig.verticalSpaceLarge(),

                      CustomButtonWidget(onPressed: (){
                        gxValues.onSubmit();

                      },buttonText: AppString.submit,),
                      SizeConfig.verticalSpaceLarge(),

                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
