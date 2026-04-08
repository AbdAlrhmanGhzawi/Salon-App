import 'package:salon_project/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screen/about_as.dart';
import '../../view/screen/booking/CancelBooking.dart';
import '../../view/screen/booking/ConfirmBooking.dart';
import '../../view/screen/home/HomePage.dart';
import '../../view/screen/myBooking.dart';
import '../../view/screen/profile.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const Home_page(),
    profile(),
    MyBookin(),
    about_as()
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "works", "icon": Icons.work_outline_sharp},
    {"title": "about", "icon": Icons.person_2_outlined}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

  goToCancelBooking()
  {
    Get.toNamed(AppRoute.CancelBooking);
  }
}
