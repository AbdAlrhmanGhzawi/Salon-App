import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';


import '../../../controller/auth/login_controler.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imagasset.dart';
import '../../../core/functions/checkinternet.dart';

class CustomLottie extends StatelessWidget {

  const CustomLottie( {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControlerImp controler = Get.put(LoginControlerImp());
    return Container(
      child: Column(
        children: [

          SizedBox(height: 100),

          Center(

            child: Lottie.asset(AppImageAsset.noInternet , width: 300 , height:  300  ),
          ),
          SizedBox(height: 100),

          Text("Check the Internet !!" , style: Theme.of(context).textTheme.headline1 ,)
          //SizedBox(height: 20),
          // MaterialButton(
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(20)),
          //   padding: const EdgeInsets.symmetric(vertical: 13),
          //   onPressed: () async {
          //     if(await checkInternet())
          //       {
          //
          //
          //
          //       }
          //     else {
          //
          //     }
          //   },
          //   color: AppColor.primaryColor,
          //   textColor: Colors.white,
          //   child: Container(margin: EdgeInsets.all(10),
          //       child: Text("back to log in", style: const TextStyle(
          //           fontWeight: FontWeight.bold, fontSize: 16))),
          // ),
        ],
      ),
    );
  }
}