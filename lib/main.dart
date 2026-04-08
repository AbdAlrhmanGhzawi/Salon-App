import 'package:salon_project/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/intialbindings.dart';
import 'core/constant/color.dart';
import 'core/services/services.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  initializeDateFormatting();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey:
        "AIzaSyDcB-NXmjvM1bD4nrtRxHmKHCAZE7aKf-g", // paste your api key here
        appId:
        "1:403880298346:android:117f1151c1b7cd35250713", //paste your app id here
        messagingSenderId: "403880298346", //paste your messagingSenderId here
        projectId: "salonapp-de8ea", //paste your project id here
     )
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    final notification = message.notification;
    if (notification != null) {
      print('Notification Title: ${notification.title}');
      print('Notification Body: ${notification.body}');
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance.getToken().then((value) {
      print("token = ${value}") ;
     }
    );
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: "GilroyHeavy",
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
            headline2: TextStyle(
                fontFamily: "GilroyHeavy",
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: AppColor.black),
            headline3: TextStyle(
                color: AppColor.primaryfourthColor ,
                fontFamily: 'GilroyHeavy' ,
                fontSize: 45 ,
                fontWeight: FontWeight.w800

            ),

            bodyText1: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14),
            bodyText2: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontSize: 14)
        ),
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitialBindings() ,
      getPages: routes,

    );
  }
}