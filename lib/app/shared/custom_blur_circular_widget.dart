import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';

class CustomBlurCircularWidget extends StatelessWidget {
  final Widget child;
   CustomBlurCircularWidget({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.black.withOpacity(.3),
          shape: BoxShape.circle
      ),
      child: child,
    );
  }
}
