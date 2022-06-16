import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/text_style.dart';

class CustomFilterWidget extends StatelessWidget {
  final Function onClickFilter;
   CustomFilterWidget({Key? key,required this.onClickFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: (){
            onClickFilter();
          },
          child: Row(
            children: [
              Icon(Icons.filter_alt_outlined),
              Text(AppString.filter.tr,style: AppStyles.mediumTextStyle.copyWith(
                  fontWeight: FontWeight.w500
              ),),
            ],
          ),
        )
      ],
    );
  }
}
