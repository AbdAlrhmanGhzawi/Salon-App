
import 'package:salon_project/core/class/statusrequest.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:firebase_messaging/firebase_messaging.dart';


import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datatsource/remote/auth/signup.dart';



abstract class SignUpControler extends GetxController {

  signUp(BuildContext context) ;
  goToLogIn();
  Future<void> addUser() ;

}

class SignUpControlerImp extends SignUpControler {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email ;
  late TextEditingController password ;
  late TextEditingController phone ;
  late TextEditingController username ;
  late TextEditingController address ;
  MyServices myServices = Get.find() ;


  SignUpData signUpData = SignUpData(Get.find()) ;
  List data = [];
  StatusRequest? statusRequest = StatusRequest.none;

  @override
  signUp(BuildContext context) async {


    String? token = "";
    FirebaseMessaging.instance.getToken().then((value) async {


      var formdata= formstate.currentState ;
      if(formdata!.validate())
      {

        String? token = "";
        FirebaseMessaging.instance.getToken().then((value) {
          token = value ;
        });
        print("============== ${token}");


        try {
          statusRequest = StatusRequest.loading;
          update();
          var response = await signUpData.postData(username.text, password.text, email.text, phone.text, address.text , value!);
          print("=============================== Controller $response ") ;
          statusRequest = handlingData(response);
          if (StatusRequest.success == statusRequest) {
            if(response['status'] == "success")
            {
              // data.addAll(response['data']);
              Get.offNamed(AppRoute.successSignUp) ;
            }
            else {
              Get.defaultDialog(title: "warning" , middleText: "Phone Number or Email Already Exists") ;
              statusRequest = StatusRequest.failure ;
            }
          }
          update();




          // AwesomeDialog(
          //     context: context  ,
          //     title:"alert" ,
          //     body: Text("A verification link has been sent, please confirm your account via your email")
          // ).show() ;

        }
        catch (e) {
          print(e);
        }

      }
      else {

      }



    });




  }

  @override
  goToLogIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    address = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Future<void> addUser() async {

    /*CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.add({
      'email': email.text,
      'password': password.text ,
      'phone':  phone.text ,
      'username': username.text
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));



     */

  }

}