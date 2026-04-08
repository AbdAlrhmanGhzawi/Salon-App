
import 'package:salon_project/core/constant/routes.dart';
import 'package:salon_project/data/datatsource/remote/home/home_data.dart';
import 'package:salon_project/data/model/EmployeesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/services/services.dart';

abstract class EmployeesDetailsController extends GetxController {


}

class EmployeesDetailsControllerImp extends EmployeesDetailsController {
  // CartController cartController = Get.put(CartController());

  late EmployeesModel employeesModel;

  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  int countitems = 5;

  List services = [] ;


  intialData() async {
    statusRequest = StatusRequest.loading;
    employeesModel = Get.arguments['employeesModel'];
    services = Get.arguments['services'] ;

    print(employeesModel.idEmp) ;
    //countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  viewServices(){
    Get.toNamed(AppRoute.items , arguments:
    {
      "employeesModel": employeesModel ,
      "services" : services
    }
    ) ;

  }


  // getCountItems(String itemsid) async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await cartData.getCountCart(
  //       myServices.sharedPreferences.getString("id")!, itemsid);
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       int countitems = 0;
  //       countitems = int.parse(response['data']);
  //       print("==================================");
  //       print("$countitems");
  //       return countitems;
  //       // data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  // }

  // addItems(String itemsid) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await cartData.addCart(
  //       myServices.sharedPreferences.getString("id")!, itemsid);
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       Get.rawSnackbar(
  //           title: "اشعار",
  //           messageText: const Text("تم اضافة المنتج الى السلة "));
  //       // data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  //   update();
  // }

  // deleteitems(String itemsid) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //
  //   var response = await cartData.deleteCart(
  //       myServices.sharedPreferences.getString("id")!, itemsid);
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       Get.rawSnackbar(
  //           title: "اشعار",
  //           messageText: const Text("تم ازالة المنتج من السلة "));
  //       // data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  //   update();
  // }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  // add() {
  //   addItems(itemsModel.itemsId!);
  //   countitems++;
  //   update();
  // }
  //
  // remove() {
  //   if (countitems > 0) {
  //     deleteitems(itemsModel.itemsId!);
  //     countitems--;
  //     update();
  //   }
  // }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
