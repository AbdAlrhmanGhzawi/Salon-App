import 'package:salon_project/core/class/statusrequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datatsource/remote/home/home_data.dart';
import '../../data/model/EmployeesModel.dart';
import '../../data/model/ServicesModel.dart';

abstract class ServicesController extends GetxController {
   intialData();
   goToDetails(ServicesModel servicesModel);
}

class ServicesControllerImp extends ServicesController {



  TextEditingController? search ;
  bool isSearch =false ;

  late EmployeesModel employeesModel;
  List services = [] ;
  List co_services = [] ;

  StatusRequest statusRequest = StatusRequest.none ;

  @override
  void onInit() {
    intialData();
    search = TextEditingController();
    super.onInit();
    }


  HomeData homedata = HomeData(Get.find());


  List listdata = [] ;
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


  @override
  intialData() {
    statusRequest = StatusRequest.loading ;
    services = Get.arguments['services'] ;
    employeesModel = Get.arguments['employeesModel'] ;

    co_services.clear() ;
    for(int i = 0 ; i < services.length ; i++)
      {
        if(ServicesModel.fromJson(services[i]).idEmp == employeesModel.idEmp)
          {
            co_services.add(services[i]);
          }
      }
    if(co_services.isEmpty)
      statusRequest = StatusRequest.failure ;
    else
      statusRequest = StatusRequest.success ;

    print(co_services.length) ;
    // categories_id = Get.arguments['categor ies_id'] ;
   //  categories_name = Get.arguments['categories_name'] ;
    // changeCat(categories_id!) ;
  }

  @override
  goToDetails(ServicesModel servicesModel) {
    Get.toNamed(AppRoute.ServicesDetails ,
    arguments: {
      "servicesModel" : servicesModel ,
       }
    );

  }







}