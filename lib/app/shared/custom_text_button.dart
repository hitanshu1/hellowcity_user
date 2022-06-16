
import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/text_style.dart';

class CustomTextButton extends StatelessWidget {
  final String? text;
  final TextStyle ?style;
  final Function ? onPressed;
  const CustomTextButton({Key? key,this.text,this.style,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
     if( onPressed!=null){
       onPressed!();
     }
    }, child: Text(text??'',style: style??AppStyles.smallTextStyle.copyWith(
      color: AppColors.blueColor
    ),));
  }
}
