import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hellowcity/app/data/text_style.dart';

import 'plateform_widget.dart';


class PlatformAlertDialog extends PlatformWidget {
  PlatformAlertDialog({
    required this.title,
     this.content,
    this.cancelActionText,
    this.defaultFunction,
    this.defaultFunction2,
    this.contentWidget,
    this.barrierDismissible:false,
    required this.defaultActionText,
    this.defaultActionText2
  })  :assert(defaultActionText != null);

  final String title;
  final String? content;
  final String? cancelActionText;
  final String? defaultActionText;
  final String? defaultActionText2;
  final Function? defaultFunction;
  final Function? defaultFunction2;
  final Widget? contentWidget;
  final bool barrierDismissible;

  Future<bool?> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => this,
    )
        : await showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => this,
    );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(

      title: Text(title,style: AppStyles.mediumTextStyle),
      content: contentWidget??Text(content??'', style:AppStyles.smallTextStyle),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: AppStyles.mediumTextStyle,),
      content: contentWidget??Text(content??'', style:AppStyles.smallTextStyle,),
      backgroundColor: Theme.of(context).cardColor,
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final actions = <Widget>[];

    if(cancelActionText!=null){
      actions.add(
        PlatformAlertDialogAction(
          child: Text(cancelActionText??'',style: AppStyles.smallTextStyle,),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      );

    }


    actions.add(
      PlatformAlertDialogAction(
        child: Text(defaultActionText??'',style: AppStyles.smallTextStyle),
        onPressed: () {
          if(defaultFunction!=null){
            defaultFunction!();
          }else{
            Navigator.of(context).pop(true);
          }

        },
      ),
    );
    if(defaultActionText2!=null){
    actions.add(
          PlatformAlertDialogAction(
            child: Text(defaultActionText2??'', style:AppStyles.smallTextStyle),
            onPressed: (){
              if(defaultFunction2!=null){
                defaultFunction2!();

              }else{
                Navigator.of(context).pop(true);
              }

            },
          )
      );
    }

    return actions;
  }
}

class PlatformAlertDialogAction extends PlatformWidget {
  PlatformAlertDialogAction({required this.child,required this.onPressed});
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
