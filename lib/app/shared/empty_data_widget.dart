import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/text_style.dart';
class EmptyDataWidget extends StatelessWidget {
  final String? text;
   EmptyDataWidget({Key? key,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(text??'',style: AppStyles.mediumTextStyle.copyWith(
          fontWeight: FontWeight.bold,color: AppColors.darkGrayLittleColor,
        ),textAlign: TextAlign.center,),
      ),
    );
  }
}
