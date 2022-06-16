import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/product_review.dart';
import 'package:hellowcity/app/modules/ResCustomerItemDetails/controllers/res_customer_item_details_controller.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/user_provider.dart';
import 'package:hellowcity/app/services/app_get_service.dart';

class SubmitProductReviewController extends GetxController {
  //TODO: Implement SubmitProductReviewController

  bool isLoading=false;
  ResCustomerItemDetailsController resCustomerItemDetailsController=Get.put(ResCustomerItemDetailsController());
  HomeController homeController=Get.put(HomeController());

  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  void initializeData(ProductReview? val){
    if(val!=null){
      titleController.text=val.title??'';
      descriptionController.text=val.description??'';
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onSubmitReview()async{
    isLoading=true;
    update();
    if (formKey.currentState!.validate()) {
      ApiResponseModel response=await UserProvider().reviewProduct(ProductReview(
          productId: resCustomerItemDetailsController.foodItem?.id?.toString(),
          description: descriptionController.text,
          review_by: homeController.userDetails?.id?.toString(),
          title: titleController.text
      ));
      if(response.status==1){
        AppGetService.back();
        resCustomerItemDetailsController.getReviewList();
        AppGetService.successSnackbar(response.message??'');
      }else{
        AppGetService.errorSnackbar(response.message??'');
      }
    }

    isLoading=false;
    update();
  }

}
