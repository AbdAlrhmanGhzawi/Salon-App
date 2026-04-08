
import 'package:salon_project/core/constant/routes.dart';
import 'package:salon_project/data/datatsource/remote/home/home_data.dart';
import 'package:salon_project/data/model/EmployeesModel.dart';
import 'package:salon_project/data/model/ServicesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/services/services.dart';

abstract class ServicesDetailsController extends GetxController {


}

class ServicesDetailsControllerImp extends ServicesDetailsController {
  // CartController cartController = Get.put(CartController());

  late ServicesModel servicesModel ;

  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();



  List services = [] ;

  int flag = 0;

  intialData() async {
    statusRequest = StatusRequest.loading;
    servicesModel = Get.arguments['servicesModel'];
   // flag = Get.arguments['flag'];

    print(servicesModel.maxTime) ;
    //countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  goToBooking(){
    Get.toNamed(AppRoute.BookingServices ,
        arguments: {
          "servicesModel" : servicesModel ,

        }
    );
  }






  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
