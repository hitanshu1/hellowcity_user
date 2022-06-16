import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
class CustomFilePickerField extends StatelessWidget {
  final String? fileName,hintText;
  final Function? onTap;

   CustomFilePickerField({Key? key,this.onTap,this.hintText,this.fileName}) : super(key: key);

  final double _height=SizeConfig.screenHeight*.06;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap!=null){
          onTap!();
        }
      },
      child: Container(
        height: _height,
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          border: Border.all(color: Colors.blueGrey[50]!),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(child: Padding(
              padding: SizeConfig.innerSidePadding,
              child: Text(
                fileName??(hintText??''),style: AppStyles.smallTextStyle,
              ),
            )),
            SizeConfig.horizontalSpace(5),
            Container(
              height: _height,
              width: 120,
              child: Center(
                child: Text('Select File',style: AppStyles.smallTextStyle.copyWith(
                  fontWeight: FontWeight.bold
                ),),
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
