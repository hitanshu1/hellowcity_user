import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';


class CustomListTileWidget extends StatelessWidget {
 final  String ?firstText,secondText;
 final TextStyle? firstStyle,secondStyle;
   CustomListTileWidget({Key? key,this.secondText,this.firstText,this.firstStyle,this.secondStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(firstText??'',style: firstStyle??AppStyles.largeTextStyle.copyWith(
              color: AppColors.black,fontWeight: FontWeight.bold
          ),),
        ),
        SizeConfig.horizontalSpaceSmall(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // widget.product.discount>0?Text('${widget.product.discount} % off',style: AppStyles.GreensmallerTextStyleW500,textAlign: TextAlign.right,):Container(),
            Text(secondText??'',style: secondStyle??AppStyles.largeTextStyle.copyWith(
                color: AppColors.black
            ),),
          ],
        ),

      ],
    );
  }
}
