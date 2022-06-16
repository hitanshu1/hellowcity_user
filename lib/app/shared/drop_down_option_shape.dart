import 'package:flutter/material.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
class DropDownOptionShape extends StatelessWidget {
  final String? title;
  final bool isBottomBorder;
  final Function? onTap;
  const DropDownOptionShape({Key? key,this.title,this.isBottomBorder:true,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap!=null){

          onTap!();
          AppGetService.back();
        }
      },
      child: Container(
        height: SizeConfig.screenHeight*.05,
        decoration: BoxDecoration(
            border: isBottomBorder?Border(bottom: BorderSide(color: AppColors.lightGreyColor)):null
        ),
        child: Center(
          child: Padding(
            padding: SizeConfig.smallPadding,
            child: Text(title??'',style: AppStyles.smallTextStyle.copyWith(
                fontWeight: FontWeight.w700
            ),),
          ),
        ),
      ),
    );
  }
}
