import 'package:salon_project/controller/MyBookinControllerImp.dart';
import 'package:salon_project/core/constant/imagasset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/booking/cancelBooking_controller.dart';
import '../../../controller/booking/confirmBooking_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/dialogueConfirm.dart';
import '../../../data/model/BookingModel.dart';


class MyBookin extends StatelessWidget {
  const MyBookin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyBookinControllerImp()) ;
    return
      Scaffold(
        appBar: AppBar(
          title: Text('salon works'),
        ),
        body: GetBuilder<MyBookinControllerImp>(
          builder: (controller) =>
              HandlingDataView(
                statusRequest: controller.statusRequest ,
                widget:
                ListView.builder(
                  itemCount: controller.salonWorks.length,
                  itemBuilder: (context, index) {
                    return
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/image/" + controller.salonWorks[index]['urlImage'] ),
                          ) ;



                  },
                ),
              ),

        ) ,

      );


  }

}
