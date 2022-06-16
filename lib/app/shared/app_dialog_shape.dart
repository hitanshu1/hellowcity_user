import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/services/app_get_service.dart';

class  AppDialogShape extends StatelessWidget {
  final double? height,width;
  final Widget? child;
  const  AppDialogShape({Key? key,this.height,this.child,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool sPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: SizeConfig.padding,
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              IconButton(onPressed: (){
                AppGetService.back();
              }, icon: Icon(Icons.clear))
            ],),
            if(child!=null)child!,
          ],
        ),
      ),
    );
  }
}
