import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


void myBackgroundMessageHandler(Map<String, dynamic> message) {
  print('backgroundMessage received ${message.containsKey('data')}');
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }
}

void myOnLaunchMessageHandler(RemoteMessage message,) {
  print('launchMessage received ${message.data.containsKey('data')}');
  if (message.data.containsKey('data')) {
    // Handle data message
    final dynamic data = message.data['data'];
    String page = message.data["data"]['page'];
    // Navigator.pushNamed(context, page);
  }

  if (message.data.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message.data['notification'];
    String page = message.data["notification"]['page'];
    // Navigator.pushNamed(context, page);
  }
}

void myOnResumeMessageHandler(RemoteMessage message,) {
  print('launchMessage received ${message.data.containsKey('data')}');
  if (message.data.containsKey('data')) {
    // Handle data message
    final dynamic data = message..data['data'];
    String page = message.data["data"]['page'];
    // Navigator.pushNamed(context, page);
  }

  if (message.data.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message.data['notification'];
    String page = message.data["notification"]['page'];
    // Navigator.pushNamed(context, page);
  }
}

void myOnMessageMessageHandler(Map<String, dynamic> message) {
  print('onMessage received ${message.containsKey('data')}');
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    print('oooooooooooooooooooo${message['data']}');
    LocalNotification().showLocalNotification(data);
//    try{

//    }catch(e){
//
//      print('error=$e');
//
//    }



  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
    LocalNotification().showLocalNotification(notification);

  }
}


class LocalNotification{
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  void configLocalNotification() {
    var initializationSettingsAndroid = new AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(android:initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
  Future showLocalNotification(RemoteMessage message) async {

    String title = message.data['data']['title'] ?? message.data["notification"]["title"];
    String body = message.data['data']['body'] ?? message.data["notification"]["body"];


    InitializationSettings initSettings =  InitializationSettings(
        android: AndroidInitializationSettings(
          'mipmap/ic_launcher',
        ),
        iOS: IOSInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(initSettings,onSelectNotification:(pathAndDocumentId)async{
      String page = message.data['data']['page'] ?? message.data["notification"]["page"];
//      Navigator.pushNamed(context, page);

      //TODO do something
    });
    AndroidNotificationDetails android = new AndroidNotificationDetails(
      'Notifications',
      "default",
      importance: Importance.max,
      playSound: true,
      priority: Priority.high,
    );
    NotificationDetails notificationDetails =  new NotificationDetails(android:android,iOS: IOSNotificationDetails());
    await flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails,payload:"payload");

  }
}

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
  PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;
  void _navigateToItemDetail(Map<String, dynamic> message,context) {


    String page = message["data"]['page'];
    Navigator.pushNamed(context, page);

  }

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestPermission();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        LocalNotification().showLocalNotification(message);
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        myOnLaunchMessageHandler(message,);
      });
      // FirebaseMessaging.onBackgroundMessage(((RemoteMessage message) async {
      //   myOnResumeMessageHandler(message,context);
      // }));


      // For testing purposes print the Firebase Messaging token
      String? token = await _firebaseMessaging.getToken();
      print("#######################$token");
      Future.delayed(Duration(seconds: 2),(){
        print(token);

      });
      _firebaseMessaging.subscribeToTopic("event");

      _initialized = true;
    }
  }

  Future? subcripeUserId(String userid){
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!####!!!!!!!!!!$userid");
    _firebaseMessaging.subscribeToTopic(userid);

  }


  Future getToken()async{
    String? token = await _firebaseMessaging.getToken();
    print("#######################$token");
    return token;
  }
}
