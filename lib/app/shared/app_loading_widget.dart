import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_constant.dart';

class AppLoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const AppLoadingWidget({Key? key,required this.child, this.isLoading:false}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isLoading?Positioned.fill(child: Container(
            color: AppColors.lightGreyColor.withOpacity(.1),
            child: Center(child: AppConstants.circularProgressIndicator()))):Container()
      ],
    );
  }
}
