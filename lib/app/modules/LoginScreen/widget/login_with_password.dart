import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/modules/LoginScreen/controllers/login_screen_controller.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';

class LogInWithPasswordWidget extends StatelessWidget {
  const LogInWithPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
        builder: (gxValues){
          return Padding(
            padding: SizeConfig.padding,
            child: CustomListView(
              children: [
                SizeConfig.verticalSpaceLarge(),
                CustomTextFieldWidget(
                  controller: gxValues.phoneNumberController,
                  hintText: AppString.phone.tr,
                  keyboardType: TextInputType.phone,
                ),
                SizeConfig.verticalSpaceSmall(),
                CustomTextFieldWidget(
                  controller: gxValues.passwordController,
                  obscureText: true,
                  hintText: AppString.password.tr,

                ),
                SizeConfig.verticalSpaceMedium(),
                CustomButtonWidget(
                  buttonText: AppString.login.tr,
                  onPressed: (){
                   gxValues.onLoginWithPassword();
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
                  gxValues.onChangePage(LogInPageView.register);
                }, child: Text(AppString.register.tr,
                  style: AppStyles.smallTextStyle.copyWith(
                      color: AppColors.primaryColor,fontWeight: FontWeight.w700
                  ),)),
                SizeConfig.verticalSpaceMedium(),

              ],
            ),
          );
        });
  }
}
