import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/model/product_review.dart';
import 'package:hellowcity/app/modules/ResCustomerItemDetails/controllers/res_customer_item_details_controller.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/shared/app_review_tile_widget.dart';
import 'package:hellowcity/app/shared/custom_listview.dart';

import '../controllers/view_all_review_controller.dart';

class ViewAllReviewView extends GetView<ViewAllReviewController> {

  final ResCustomerItemDetailsController resCustomerItemDetailsController=Get.put(ResCustomerItemDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.reviews.tr),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            AppGetService.navigateTo(Routes.SUBMIT_PRODUCT_REVIEW);
          }
          , icon: Icon(Icons.add))
        ],
      ),
      body:Padding(
        padding: SizeConfig.padding,
        child: CustomListView.builder(
          itemCount: resCustomerItemDetailsController.reviews.length,
            itemBuilder: (context,int index){
            ProductReview review=resCustomerItemDetailsController.reviews[index];
              return AppReviewTileWidget(review: review);
            }),
      ),
    );
  }
}
