import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/LoginScreen/controllers/login_screen_controller.dart';
import 'package:hellowcity/app/services/app_validation_service.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';



class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
        builder: (gxValues){
          return Padding(
            padding: SizeConfig.padding,
            child: Form(
              key: gxValues.registerFormKey,
              child: CustomListView(
                children: [
                  SizeConfig.verticalSpaceLarge(),
                  CustomTextFieldWidget(
                    controller: gxValues.phoneNumberController,
                    hintText: AppString.name.tr,
                    keyboardType: TextInputType.name,
                    validator: (val)=>AppValidationService.stringValidator(val, AppString.name.tr),
                  ),
                  SizeConfig.verticalSpaceSmall(),
                  CustomTextFieldWidget(
                    controller: gxValues.phoneNumberController,
                    hintText: AppString.phone.tr,
                    keyboardType: TextInputType.phone,
                    validator: (val)=>AppValidationService.stringPhoneValidator(val, AppString.phone.tr),
                  ),
                  SizeConfig.verticalSpaceSmall(),
                  CustomTextFieldWidget(
                    controller: gxValues.passwordController,
                    obscureText: true,
                    hintText: AppString.password.tr,
                    validator: (val)=>AppValidationService.stringValidator(val, AppString.password.tr),

                  ),
                  SizeConfig.verticalSpaceMedium(),
                  CustomButtonWidget(
                    buttonText: AppString.register.tr,
                    onPressed: (){
                      gxValues.registerWithPassword();
                    },
                  ),
                  SizeConfig.verticalSpaceMedium(),
                  TextButton(onPressed: (){
                    gxValues.onChangePage(LogInPageView.otp);
                  }, child: Text(AppString.loginWithOtp.tr,
                    style: AppStyles.smallTextStyle.copyWith(
                        color: AppColors.primaryColor,fontWeight: FontWeight.w700
                    ),)),
                  SizeConfig.verticalSpaceSmall(),
                  TextButton(onPressed: (){
                    gxValues.onChangePage(LogInPageView.password);
                  }, child: Text(AppString.loginWithPassword.tr,
                    style: AppStyles.smallTextStyle.copyWith(
                        color: AppColors.primaryColor,fontWeight: FontWeight.w700
                    ),)),
                  SizeConfig.verticalSpaceMedium(),

                ],
              ),
            ),
          );
        });
  }
}
