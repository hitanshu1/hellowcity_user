import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
class CustomTitleWithValueTileWidget extends StatelessWidget {
  final String title,value;
  final TextStyle ?titleTextStyle,valueTextStyle;
   CustomTitleWithValueTileWidget({Key? key,required this.value,required this.title,
   this.titleTextStyle,this.valueTextStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
          width:SizeConfig.screenWidth*.4 ,
            child: Text(title,style: titleTextStyle??AppStyles.largeTextStyle.copyWith(
              color: AppColors.black,fontWeight: FontWeight.bold
            ),),
      ),
          SizeConfig.horizontalSpaceSmall(),
          Expanded(child: Text(value,style: titleTextStyle??AppStyles.mediumTextStyle.copyWith(
              color: AppColors.darkGrayColor,
          ),textAlign: TextAlign.end,),),
        ],
      ),
    );
  }
}
