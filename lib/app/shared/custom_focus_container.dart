import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';

class CustomFocusContainer extends StatelessWidget {
  final Widget ?child;
  const CustomFocusContainer({Key? key,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.red)
      ),
      child: Padding(
        padding: SizeConfig.padding,
        child: child,
      ),
    );
  }
}
