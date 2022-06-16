import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellowcity/app/data/app_material_icons_icons.dart';


class AppBackButton extends StatelessWidget {
  final Function? onPressed;
  const AppBackButton({Key? key,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

      if(onPressed!=null){
        onPressed!();
      }else{
        Navigator.pop(context);
      }

    }, icon: Icon(Platform.isIOS?AppMaterialIcons.left_open_big:Icons.arrow_back));
  }
}
