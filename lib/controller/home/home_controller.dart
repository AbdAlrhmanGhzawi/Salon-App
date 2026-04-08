
import 'package:salon_project/data/model/EmployeesModel.dart';
import 'package:salon_project/data/model/ServicesModel.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datatsource/remote/home/home_data.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getdata();
  goToServicesDetails(ServicesModel servicesModel, int flag) ;
  goToManager();

  goToItems(List categories, int selectedCat, String categoryid);

}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;

  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List employees = [] ;
  List services = [] ;
  List offerServices = [] ;


  bool isAdmin = false ;




  @override
  initialData() {
  String? state = myServices.sharedPreferences.getString("type");
  if(state == "admin") isAdmin =true ;

  }

  @override
  void onInit() {

    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        employees.addAll(response['data1']);
        services.addAll(response['data2']);

        for(int i = 0 ; i < services.length ; i++){
          if(services[i]['offer'] == 1){
            offerServices.add(services[i]);
          }
        }

        print(services);
       // services.addAll(response['services']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(employeesModel) {
    Get.toNamed(AppRoute.EmployeeDetails,
        arguments:
        {
          "employeesModel": employeesModel ,
          "services" : services
        });
  }

  @override
  goToServicesDetails(ServicesModel servicesModel , int flag) {
    Get.toNamed(AppRoute.ServicesDetails , arguments: {
      "servicesModel" : servicesModel ,
      "flag" : flag
    });
  }

  @override
  goToManager() {
    Get.toNamed(AppRoute.ConfirmBooking);

  }

  void goToDetails(ServicesModel servicesModel) {


  }


}

class SearchMixController extends GetxController {
  List listdata = [];

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        listdata.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    else{
      isSearch = true ;
      searchData();
    }

    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
