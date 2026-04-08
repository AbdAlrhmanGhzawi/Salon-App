import 'package:salon_project/core/constant/imagasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/booking/cancelBooking_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/dialogueConfirm.dart';
import '../../../data/model/BookingModel.dart';





class CancelBooking extends StatelessWidget {
  const CancelBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Get.put(CancelBookingController()) ;
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Available Bookings'),
        ),
        body:GetBuilder<CancelBookingController>(
          builder: (controller) =>
        HandlingDataView(
          statusRequest: controller.statusRequest ,
          widget:
                ListView.builder(
                  itemCount: controller.availableBookings.length,
                  itemBuilder: (context, index) {
                    SportBooking sportBooking = SportBooking.fromJson(controller.availableBookings[index]);
                    return Container(
                      height: 140 ,
                      child: Card(
                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5,top: 5),
                                child: Container(width:80 , child: Image.asset(AppImageAsset.avotar)),
                              ) ,
                              SizedBox(width: 40,) ,
                              Column(children: [
                                Text(sportBooking.nameSer! , style: TextStyle(fontWeight: FontWeight.w600 , color: Colors.black),) ,
                                Text('التاريح : ${DateTime.parse(sportBooking.bookingStart!).year}-${DateTime.parse(sportBooking.bookingStart!).month}-${DateTime.parse(sportBooking.bookingStart!).day}') ,
                                Text('الساعة : ${DateTime.parse(sportBooking.bookingStart!).hour}:${DateTime.parse(sportBooking.bookingStart!).minute}') ,

                              ],),
                              Spacer(),
                              InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: (){
                                  dialogueConfirm("تأكيد حذف الموعد لهذه الخدمة ؟" , (){
                                    controller.deleteBooking(index);
                                    Get.back() ;
                                    controller.update();
                                  }) ;
                                },
                                child: const Icon(
                               Icons.delete_outline,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),

                            ],
                          )


                        ]),
                      ),
                    );
                  },
                ),
          ),

        ) ,


      );






  }

}
