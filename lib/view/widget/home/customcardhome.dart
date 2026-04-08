
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imagasset.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(children: [
                  Icon(Icons.location_on_outlined , color: AppColor.primaryfourthColor,),
                  SizedBox(width: 10,) ,
                  Text(
                    "alforqan-street khaled" ,
                    style: TextStyle(
                        color: AppColor.primaryfourthColor ,
                        fontWeight: FontWeight.bold
                    ),

                  )
                ],) ,

                SizedBox(height: 5,) ,

                Row(children: [
                  Icon(Icons.email_outlined, color: AppColor.primaryfourthColor),
                  SizedBox(width: 10,) ,
                  Text(
                      "salonApp@gmail.com" , style: TextStyle(
                      color: AppColor.primaryfourthColor,
                      fontWeight: FontWeight.bold)

                  )


                ],) ,

                SizedBox(height: 5,) ,

                Row(children: [
                  Icon(Icons.add_ic_call_outlined, color: AppColor.primaryfourthColor),
                  SizedBox(width: 10,) ,
                  Text(
                      "0994626977" , style: TextStyle(
                              color: AppColor.primaryfourthColor,
                              fontWeight: FontWeight.bold)

                        )


                ],) ,

                SizedBox(height: 5,) ,

                Row(children: [
                  Icon(Icons.facebook_outlined, color: AppColor.primaryfourthColor),
                  SizedBox(width: 10,) ,
                  Text(
                      "facebook.salonApp.com" , style: TextStyle(
                      color: AppColor.primaryfourthColor,
                      fontWeight: FontWeight.bold)

                  )


                ],) ,



              ],
            ),
          )


        ),
        // Positioned(
        //   top: -23,
        //   right:   -23  ,
        //  // left: controller.lang == "ar" ?  -20 : null ,
        //   child: Container(
        //     height: 160,
        //     width: 160,
        //     decoration: BoxDecoration(
        //         color: AppColor.primarySecandColor,
        //         borderRadius: BorderRadius.circular(160)),
        //   ),
        // ) ,
        Positioned(
          top: -12,
          right: -20,
          child: SizedBox(
            width: 150,
            height: 150,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[100],
              backgroundImage: AssetImage("${AppImageAsset.rootImages}/about.jpg"),
            ),
          ),
        )
      ]),
    );
  }
}
