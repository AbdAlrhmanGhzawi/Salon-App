import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datatsource/remote/booking/booking_data.dart';
import '../data/model/BookingModel.dart';

class MyBookinControllerImp extends GetxController{


  late StatusRequest statusRequest = StatusRequest.none;

  BookingData bookingData = BookingData(Get.find()) ;

  MyServices myServices = Get.find() ;

  late int user_id ;
  late String username ;
  late String email ;
  late int phone ;

  List salonWorks = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await bookingData.getSalonWorks();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        salonWorks.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    print(statusRequest) ;
    update();
  }


  @override
  void onInit() async {

    user_id = myServices.sharedPreferences.getInt("user_id")!;
    username = myServices.sharedPreferences.getString("username")!;
    email = myServices.sharedPreferences.getString("email")!;
    phone = myServices.sharedPreferences.getInt("phone")!;

    await getData() ;
    super.onInit();


  }




}