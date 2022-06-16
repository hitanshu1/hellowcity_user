import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';

class AppTitleTileWidget extends StatelessWidget {
  final String ?firstText, secondText;
  final TextStyle? firstTextStyle,secondTextStyle;
  final Function? onClickSecondOption;
   AppTitleTileWidget({Key? key,this.firstText,this.secondText,this.onClickSecondOption,
   this.firstTextStyle,this.secondTextStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth*.3,
            child: Text(firstText??'',style: firstTextStyle??AppStyles.smallTextStyle.copyWith(
          fontWeight: FontWeight.w500
        ),)),
        SizeConfig.horizontalSpaceSmall(),
        Expanded(
          child: onClickSecondOption!=null?InkWell(child: Text(secondText??'',style: secondTextStyle??AppStyles.smallTextStyle.copyWith(
              fontWeight: FontWeight.w500
          ),textAlign: TextAlign.end,),
            onTap: (){
             if(onClickSecondOption!=null)
               onClickSecondOption!();
            },):Text(secondText??'',style: secondTextStyle??AppStyles.smallTextStyle.copyWith(
              fontWeight: FontWeight.w500
          ),textAlign: TextAlign.end,),
        )
      ],
    );
  }
}
