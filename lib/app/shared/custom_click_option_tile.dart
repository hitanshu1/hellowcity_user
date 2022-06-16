import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';

class CustomClickOptionTile extends StatelessWidget {
  final String? text;
  final TextStyle ?style;
  final Function? onTap;
  CustomClickOptionTile({Key? key,this.text,this.style,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap!=null){
          onTap!();
        }
      },
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: SizeConfig.padding.copyWith(
            top: SizeConfig.screenHeight*.02,
            bottom:  SizeConfig.screenHeight*.02
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(text??'',style: style??AppStyles.smallTextStyle.copyWith(
                  fontWeight: FontWeight.w600,color: AppColors.primaryColor
                ),),
              ),
              SizeConfig.horizontalSpaceSmall(),
              Icon(Icons.forward,color: AppColors.primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
