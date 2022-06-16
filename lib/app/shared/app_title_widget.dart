import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/text_style.dart';

class AppTitleWidget extends StatelessWidget {
  final String ? title;
   AppTitleWidget({Key? key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title??'',style: AppStyles.mediumTextStyle.copyWith(
        fontWeight: FontWeight.bold,color: AppColors.primaryColor
      ),),
    );
  }
}
