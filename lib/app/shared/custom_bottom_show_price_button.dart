import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
class CustomBottomShowPriceButton extends StatelessWidget {
  final Function onTap;
   final String ? firstText,secondText;
   CustomBottomShowPriceButton({Key? key,required this.onTap,this.secondText,this.firstText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        color: AppColors.primaryColor,
        height: SizeConfig.screenHeight*.08,
        child: Padding(
          padding: SizeConfig.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(firstText??'',
                style: AppStyles.smallTextStyle.copyWith(
                    fontWeight: FontWeight.bold,color: AppColors.whiteColor
                ),),
              Text(secondText??'',
                  style: AppStyles.smallTextStyle.copyWith(
                      fontWeight: FontWeight.bold,color: AppColors.whiteColor
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
