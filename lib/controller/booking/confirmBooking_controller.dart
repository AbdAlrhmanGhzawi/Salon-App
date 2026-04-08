import 'package:salon_project/core/class/crud.dart';
import 'package:salon_project/data/datatsource/remote/auth/getUser.dart';
import 'package:salon_project/data/datatsource/remote/booking/booking_data.dart';
import 'package:salon_project/data/model/BookingModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/functions/sendNotificationMessage.dart';
import '../../core/services/services.dart';



class ConfirmBookingController extends GetxController {

  late StatusRequest statusRequest = StatusRequest.none;

  BookingData bookingData = BookingData(Get.find()) ;
  getUser getuser = getUser(Get.find());

  MyServices myServices = Get.find() ;
  List pendingBookings = [] ;
  late int user_id ;
  late String username ;
  late String email ;
  late int phone ;




  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await bookingData.getPendingBooking();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        pendingBookings.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    print(statusRequest) ;
    update();
  }

  confirmBooking(int index) async {
    SportBooking sportBooking = SportBooking.fromJson(pendingBookings[index]);
    var response = await bookingData.updateStatus(sportBooking.idSer!, sportBooking.idU!) ;

    var res = await getuser.postData(sportBooking.idU!.toString());
    print(res);
    if(response['status'] == "success")
    {
      pendingBookings.removeAt(index);
      update();
      Get.snackbar(
        'الحجوزات',
        'تم تأكيد الموعد وارسال اشعار الى صاحب الموعد',
        duration: Duration(seconds: 3), // Set the duration to 3 seconds
        backgroundColor: Colors.green, // Set the background color to green
        colorText: Colors.white, // Set the text color to white
        shouldIconPulse: true, // Make the icon pulse
        snackPosition: SnackPosition.BOTTOM, // Set the position to bottom
      );
      sendNotificationMessage("تم حجز الموعد بنجاح" , "تنبيه" , "صالون تجميل " , res['data'][0]['token']);
    }

  }


  deleteBooking(int index)
  async {
    SportBooking sportBooking = SportBooking.fromJson(pendingBookings[index]);

    var response = await bookingData.deleteData(sportBooking.idSer!, sportBooking.idU!) ;

    if(response['status'] == "success")
      {
        pendingBookings.removeAt(index);
        update();
        Get.snackbar(
          'الحجوزات',
          'تم حذف الموعد بنجاح',
          duration: Duration(seconds: 3), // Set the duration to 3 seconds
          backgroundColor: Colors.green, // Set the background color to green
          colorText: Colors.white, // Set the text color to white
          shouldIconPulse: true, // Make the icon pulse
          snackPosition: SnackPosition.BOTTOM, // Set the position to bottom
        );
      }


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