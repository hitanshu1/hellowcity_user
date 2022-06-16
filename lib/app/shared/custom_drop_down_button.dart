import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/text_style.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  final String? hintText,titleText,showText;
  final TextStyle? titleTextStyle;
  final List<T>list;
  final T? val;
  final Function(T) onChange;
   final List<DropdownMenuItem<T>>? items;

   CustomDropDownButton({Key? key, this.items,this.showText,this.titleTextStyle,this.titleText,required this.onChange,this.hintText,required this.list,this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText!=null?Text(titleText??'',style: titleTextStyle??AppStyles.largeTextStyle.copyWith(
            fontWeight: FontWeight.bold,color: AppColors.primaryColor
        ),):Container(),
        DropdownButton<T>(
          isExpanded: true,
          hint: Text(hintText??'',textAlign: TextAlign.center,),
          items:items,
          value: val,
          onChanged: (T? newValue) {
            if (newValue != null) {
              onChange(newValue);
            }
          },
        ),
      ],
    );
  }
}
