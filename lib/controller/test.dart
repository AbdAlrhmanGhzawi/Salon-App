import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/datatsource/remote/test_data.dart';

class Test extends GetxController {


   late TextEditingController myController ;

   List<String> list = [] ;

  @override
  void onInit() {
    myController = TextEditingController();
    super.onInit();
  }

  addToList() {
    print('object');
    list.add(myController.text) ;
    update() ;
  }

}