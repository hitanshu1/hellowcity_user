import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/enum/device_type.dart';
import 'package:hellowcity/app/data/size_config.dart';

class AppGridViewWidget extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final ScrollPhysics ?physics;
  final bool? shrinkWrap;
  const AppGridViewWidget({Key? key,required this.itemBuilder,required this.itemCount,this.physics,this.shrinkWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap:shrinkWrap??false,
      physics: physics,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          
            childAspectRatio: 1 ,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            crossAxisCount: SizeConfig.deviceType==DeviceType.tablet?3:2),
        itemCount: itemCount,
        itemBuilder:itemBuilder);
  }
}
