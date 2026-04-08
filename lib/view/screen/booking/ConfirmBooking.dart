import 'package:salon_project/core/constant/imagasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/booking/cancelBooking_controller.dart';
import '../../../controller/booking/confirmBooking_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/dialogueConfirm.dart';
import '../../../core/functions/sendNotificationMessage.dart';
import '../../../data/model/BookingModel.dart';





class ConfirmBooking extends StatelessWidget {
  const ConfirmBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Get.put(ConfirmBookingController()) ;
    return
      Scaffold(
        appBar: AppBar(
          title: Text('الحجوزات المعلقة'),
        ),
        body:GetBuilder<ConfirmBookingController>(
          builder: (controller) =>
        HandlingDataView(
          statusRequest: controller.statusRequest ,
          widget:
                ListView.builder(
                  itemCount: controller.pendingBookings.length,
                  itemBuilder: (context, index) {
                    SportBooking sportBooking = SportBooking.fromJson(controller.pendingBookings[index]);
                    return Container(
                      height: 150 ,
                      child: Card(
                        child: Center(
                          child: Column(mainAxisSize: MainAxisSize.min, children: [
                            Row(
                              children: [
                                Spacer(),
                                Column(children: [
                                  Text(sportBooking.nameSer! , style: TextStyle(fontWeight: FontWeight.w600 , color: Colors.black),) ,
                                  Text('التاريح : ${DateTime.parse(sportBooking.bookingStart!).year}-${DateTime.parse(sportBooking.bookingStart!).month}-${DateTime.parse(sportBooking.bookingStart!).day}') ,
                                  Text('الساعة : ${DateTime.parse(sportBooking.bookingStart!).hour}:${DateTime.parse(sportBooking.bookingStart!).minute}') ,

                                ],),

                                Spacer(),
                              ],
                            ) ,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                              InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: (){
                                  dialogueConfirm("تأكيد تثبيت الموعد ؟" , (){
                                    controller.confirmBooking(index);
                                    Get.back() ;
                                    controller.update();
                                  });
                                },
                                child: const Icon(
                                  Icons.add_task_outlined,
                                  color: Colors.green,
                                  size: 30,
                                ),
                              ),
                              SizedBox(width: 30,),
                              InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: (){
                                  dialogueConfirm("تأكيد حذف الموعد لهذه الخدمة ؟" , (){
                                    controller.deleteBooking(index);
                                    Get.back() ;
                                   // sendNotificationMessage("Your appointment booking has been confirmed, we are waiting for you" ,"salonApp" , "admin" );
                                    controller.update();

                                  }) ;
                                },
                                child: const Icon(
                                  Icons.cleaning_services_outlined,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),

                            ],)

                          ]),
                        ),
                      ),
                    );
                  },
                ),
          ),

        ) ,


      );






  }

}
