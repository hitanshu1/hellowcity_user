import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/LoginScreen/widget/login_with_password.dart';
import 'package:hellowcity/app/modules/LoginScreen/widget/register_widget.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(gxValues.title),
                centerTitle: true,
              ),
              body: gxValues.view==LogInPageView.otp?Padding(
                padding: SizeConfig.padding,
                child: CustomListView(
                  children: [
                    SizeConfig.verticalSpaceLarge(),
                    gxValues.otpStep==0?CustomTextFieldWidget(
                      controller: gxValues.phoneNumberController,
                      hintText: AppString.phone.tr,
                      keyboardType: TextInputType.phone,
                    ):CustomTextFieldWidget(
                      controller: gxValues.otpController,
                      hintText: AppString.otp.tr,
                      keyboardType: TextInputType.number,
                    ),
                    SizeConfig.verticalSpaceMedium(),
                    CustomButtonWidget(
                      buttonText: gxValues.otpStep==0?AppString.sendOtp.tr:
                      AppString.verifyOtp.tr,
                      onPressed: (){
                        if(gxValues.otpStep==0){
                          gxValues.sendOtp();
                        }else{
                          gxValues.verifyOtp();
                        }

                      },
                    ),
                    SizeConfig.verticalSpaceMedium(),
                    TextButton(onPressed: (){
                      gxValues.onChangePage(LogInPageView.password);

                    }, child: Text(AppString.loginWithPassword.tr,
                      style: AppStyles.smallTextStyle.copyWith(
                          color: AppColors.primaryColor,fontWeight: FontWeight.w700
                      ),)),
                    SizeConfig.verticalSpaceSmall(),
                    TextButton(onPressed: (){
                      gxValues.onChangePage(LogInPageView.register);
                    }, child: Text(AppString.register.tr,
                      style: AppStyles.smallTextStyle.copyWith(
                          color: AppColors.primaryColor,fontWeight: FontWeight.w700
                      ),)),
                    SizeConfig.verticalSpaceMedium(),

                  ],
                ),
              ):gxValues.view==LogInPageView.register?RegisterWidget():
              LogInWithPasswordWidget(),
            ),

          );
        });
  }
}
