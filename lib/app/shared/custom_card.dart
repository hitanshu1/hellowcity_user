import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/size_config.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final EdgeInsets? margin;
  final BorderSide? side;
  final double? elevation;
  CustomCard({this.child,this.margin,this.elevation,this.side,this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child: Material(
          type: MaterialType.card,
          shadowColor: Colors.black.withOpacity(.5),
          color: color??Theme.of(context).cardColor,
          elevation: elevation??10,
          shape: RoundedRectangleBorder(
              side: side??BorderSide(color: Theme.of(context).cardColor),
              borderRadius: BorderRadius.circular(SizeConfig.borderRadius)
          ),

          child: child,
        ));
  }
}
