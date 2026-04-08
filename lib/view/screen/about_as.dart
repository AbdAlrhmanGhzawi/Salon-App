import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imagasset.dart';


class about_as extends StatelessWidget {
  const about_as({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(height: Get.width / 3, color: AppColor.primaryColor),
                Positioned(
                    top: Get.width / 3.9,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: AssetImage("${AppImageAsset.rootImages}/about.jpg"),
                      ),
                    )),
              ]),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Container(
               // height: 300,
                child: Text("Beauty Salon application to organize reservations and provide services to customers with ease and comfort.\n"
                , style: TextStyle(fontSize: 18 , color: Colors.black ,fontFamily: "GilroyHeavy"),),),
            ),
          ) ,
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: 300,
                child: Text("Created by : Abd alrahman Ghzawi and Khalaf alhussien"
                  , style: TextStyle(fontSize: 21 , color: AppColor.primaryColor ,fontFamily: "GilroyHeavy"),),),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}