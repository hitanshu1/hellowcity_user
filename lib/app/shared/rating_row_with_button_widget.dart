import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';

import 'custom_rating_widget.dart';

class RatingRowWithButtonWidget extends StatelessWidget {
  final int? initialRating,numberRatedPeople;
  final Function? onClickRateNow;
   RatingRowWithButtonWidget({Key? key,this.initialRating,this.numberRatedPeople,this.onClickRateNow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRatingWidget(
            enable: false,
            initialRating: 1,),
        SizeConfig.horizontalSpaceSmall(),
        Text('${numberRatedPeople??0}',style: AppStyles.largeTextStyle.copyWith(color: AppColors.primaryColor,
        fontWeight: FontWeight.w800),),
        Icon(Icons.person,size: 15,color: AppColors.primaryColor,),
        TextButton(onPressed: (){
          if(onClickRateNow!=null){
            onClickRateNow!();
          }
        },
            child: Text(AppString.rateNow.tr,style: AppStyles.largeTextStyle.copyWith(
              fontWeight: FontWeight.w800,color: AppColors.green
            ),))
      ],
    );
  }
}
