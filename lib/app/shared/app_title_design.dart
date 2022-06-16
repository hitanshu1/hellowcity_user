import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';


class AppTileDesign extends StatelessWidget {
  final Widget? child;
  const AppTileDesign({Key? key,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGreyColor),
          borderRadius: BorderRadius.circular(5)
      ),
      child: child,
    );
  }
}
