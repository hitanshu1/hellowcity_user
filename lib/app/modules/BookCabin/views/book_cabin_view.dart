import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_date_picker.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/app_validation_service.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';
import 'package:hellowcity/app/shared/custom_textfield_widget.dart';
import '../controllers/book_cabin_controller.dart';

class BookCabinView extends GetView<BookCabinController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookCabinController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppString.bookCabin.tr),
                centerTitle: true,
              ),
              body: Padding(
                padding: SizeConfig.sidePadding,
                child: Form(
                  key: gxValues.formKey,
                  child: ListView(
                    children: [
                      SizeConfig.verticalSpaceMedium(),
                      CustomTextFieldWidget(
                        enabled: false,
                        autoValidation: gxValues.autoValidation,
                        controller: gxValues.cabinController,
                        titleText: AppString.cabin.tr ,
                        hintText: AppString.cabin.tr ,
                        validator: (value)=>AppValidationService.stringValidator(value, AppString.cabin.tr),
                        onTap: (){
                          AppGetService.navigateTo(Routes.SEARCH_CABIN,
                              argument: gxValues.restaurantDetailsController.restaurant,then: (val){
                                gxValues.onSelectCabin();
                              });
                        },
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      CustomTextFieldWidget(
                        enabled: false,
                        controller: gxValues.dateController,
                        titleText: AppString.date.tr,
                        hintText: AppString.date.tr,
                        autoValidation: gxValues.autoValidation,
                        validator: (value)=>AppValidationService.stringValidator(value, AppString.date.tr),
                        onTap: (){
                          AppDatePicker.selectedDate(onConFirm: (val){
                            gxValues.onSelectDate(val);

                          });
                        },
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      CustomTextFieldWidget(
                        enabled: false,
                        controller: gxValues.startTimeController,
                        titleText: AppString.startTime.tr,
                        hintText: AppString.startTime.tr,
                        autoValidation: gxValues.autoValidation,
                        validator: (value)=>AppValidationService.stringValidator(value, AppString.startTime.tr),
                        onTap: (){
                          if(gxValues.selectedDate!=null){
                            AppDatePicker.selectedTime(onConFirm: (val){
                              gxValues.onSelectStartTime(val);

                            });
                          }else{
                            AppGetService.errorSnackbar(AppString.pleaseSelectDate.tr);
                          }

                        },
                      ),
                      SizeConfig.verticalSpaceSmall(),
                      CustomTextFieldWidget(
                        enabled: false,
                        controller: gxValues.endTimeController,
                        titleText: AppString.endTime.tr,
                        hintText: AppString.endTime.tr,
                        autoValidation: gxValues.autoValidation,
                        validator: (value)=>AppValidationService.stringValidator(value, AppString.endTime.tr),
                        onTap: (){
                          if(gxValues.selectedStartTime!=null){
                            AppDatePicker.selectedTime(onConFirm: (val){
                              gxValues.onSelectEndTime(val);

                            });
                          }else{
                           AppGetService.errorSnackbar(AppString.pleaseSelectStartTime.tr);
                          }

                        },
                      ),
                      SizeConfig.verticalSpaceMedium(),
                      CustomButtonWidget(onPressed: (){
                        gxValues.onSubmit();

                      },buttonText: AppString.book.tr,)

                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
