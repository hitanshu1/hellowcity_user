import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/model/product_review.dart';
import 'package:hellowcity/app/services/app_validation_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';

import '../controllers/submit_product_review_controller.dart';

class SubmitProductReviewView extends GetView<SubmitProductReviewController> {
  final ProductReview? productReview;
  SubmitProductReviewView({this.productReview});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubmitProductReviewController>(
      didChangeDependencies: (val){
        val.controller?.initializeData(productReview);
      },
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.addReview.tr),
                centerTitle: true,
              ),
              body: Padding(
                padding: SizeConfig.padding,
                child: Form(
                  key: gxValues.formKey,
                  child: CustomListView(
                    children: [
                      SizeConfig.verticalSpaceMedium(),
                      CustomTextFieldWidget(
                        hintText: AppString.title.tr,
                        controller: gxValues.titleController,
                        validator: (val)=>AppValidationService.stringValidator(val, AppString.title.tr),
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      CustomTextFieldWidget(
                        maxLines: 2,
                        hintText: AppString.description.tr,
                        controller: gxValues.descriptionController,
                        validator: (val)=>AppValidationService.stringValidator(val, AppString.description.tr),
                      ),
                      SizeConfig.verticalSpaceMedium(),
                      CustomButtonWidget(onPressed: (){
                        gxValues.onSubmitReview();
                      },buttonText: AppString.submit.tr,),
                      SizeConfig.verticalSpaceMedium(),
                    ],
                  ),
                ),
              )
            ),
          );
        });
  }
}
