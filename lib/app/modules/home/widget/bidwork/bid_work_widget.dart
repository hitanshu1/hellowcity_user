import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/shared/app_loading_widget.dart';


class BidWorkWidget extends StatelessWidget {
  const BidWorkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (gxValues){
          return AppLoadingWidget(
            isLoading: gxValues.bidWorkFunctions.isLoading,
              child: Container());
        });
  }
}
