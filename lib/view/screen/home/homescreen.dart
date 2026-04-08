import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/homescreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/home/CustomBottomAppBarHome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp controllerImp = Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(

            backgroundColor: AppColor.primaryColor,
              onPressed: () {
                controller.goToCancelBooking() ;
              },
              child: const Icon(Icons.shopping_basket_outlined)),

          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomAppBarHome() ,
          body: controller.listPage.elementAt(controller.currentpage),
        ));
  }
}