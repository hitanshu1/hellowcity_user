import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/text_style.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(AppString.comingSoon.tr,
            style: AppStyles.largeTextStyle.copyWith(
                fontWeight: FontWeight.bold
            ),),
        ),
      ],
    );
  }
}
