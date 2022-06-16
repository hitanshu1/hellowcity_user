import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/text_style.dart';


class CustomHeaderUnderLineText extends StatelessWidget {
  final String? text;
  const CustomHeaderUnderLineText({Key? key,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(text??'',style: AppStyles.largeTextStyle.copyWith(
        fontWeight: FontWeight.bold,
        decoration:  TextDecoration.underline,
      color: AppColors.primaryColor

    ),);
  }
}
