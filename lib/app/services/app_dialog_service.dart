
import 'package:flutter/material.dart';

class AppDialogService{

  static  final navigatorKey = GlobalKey<NavigatorState>();
  static  Future<dynamic> showAppDialog(Widget child) async {
    return showDialog(
      barrierColor: Colors.white.withOpacity(0.6),
      context: navigatorKey.currentContext!,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              // insetPadding: EdgeInsets.all(10),
              backgroundColor: Colors.transparent,
              child: Builder(builder: (context) {
                return child;
              }),
            );
          },
        );
      },
    ).then((value) {});
  }

  static Future<dynamic>showAutoDismissedDialog(Widget child)async{
    return showGeneralDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(navigatorKey.currentContext!)
          .modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) =>
      child,
    );
  }
}