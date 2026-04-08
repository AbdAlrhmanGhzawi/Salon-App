import 'dart:convert';

import 'package:salon_project/linkapi.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;


sendNotificationMessage(String body , String title , String subtitle , String token){

  FirebaseMessaging.instance.getToken().then((value) async {

    Map<String, dynamic> data = {
      'to': token,
     'notification': {
        "body" : body ,
        "title" : title ,
        "subtitle" : subtitle

      },
    };
    String jsonData = jsonEncode(data);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=AAAAXgkkR2o:APA91bGgjVMYbI3ZhRbSv-WtySTzWeYPZ8ovc9CYow2pMR6NPZoHeKYcNBHH-SDxdddNhdX9eHomEoC4HcTiyWHihoUKMyLzlV242qPifIXwc0cE4wO6L0dn9Bv_IF-CeqNHY0-5X4V9',
    };


    try {
      // إرسال الطلب
      http.Response response = await http.post(
        Uri.parse(AppLink.sendMessage),
        headers: headers,
        body: jsonData,
      );


      if (response.statusCode == 200) {
        // تم استلام استجابة ناجحة
        print('Request sent successfully');
        print('Response: ${response.body}');
      } else {
        // حدث خطأ في الطلب
        print('Request failed with status: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      // حدث استثناء أثناء الطلب
      print('Request failed with error: $error');
    }
  }
  );


}