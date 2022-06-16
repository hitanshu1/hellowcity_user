import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import 'app/data/app_themes.dart';
import 'app/data/translations/app_translations.dart';
import 'app/routes/app_pages.dart';
import 'app/services/app_dialog_service.dart';
import 'app/services/pushNotification.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotification().configLocalNotification();
  PushNotificationsManager().init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(

    KeyboardDismissOnTap(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        showSemanticsDebugger: false,
        translations: AppTranslations(),
        // locale: Locale('as','IN'),
        locale: Get.deviceLocale,
        fallbackLocale:Locale('en','US') ,
        initialRoute: AppPages.INITIAL,
        theme: AppThemes.light,
        getPages: AppPages.routes,
        navigatorKey: AppDialogService.navigatorKey,
      ),
    ),
  );
}
