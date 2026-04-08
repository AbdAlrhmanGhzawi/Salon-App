import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';


import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/checkinternet.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datatsource/remote/auth/login.dart';

abstract class LoginControler extends GetxController {

  login(BuildContext context) ;
  goToSignUp();
  goToForgetPassword();
  getAllData() ;
  getUserData();

}

class LoginControlerImp extends LoginControler {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email ;
  late TextEditingController password ;
  bool isshowpassword = true;
  bool isInternet = true ;
  MyServices myServices = Get.find() ;


  LogInData logInData = LogInData(Get.find()) ;

  StatusRequest? statusRequest = StatusRequest.none;


  showPassword() {
    isshowpassword = isshowpassword == true ? false : true ;
    update();
  }


  @override
  login(BuildContext context) async {

    if( 1==1 || await checkInternet())
      {
        var formdata= formstate.currentState ;
        if(formdata!.validate())
        {
          try{

            statusRequest = StatusRequest.loading;

            update();
            var response = await logInData.postData(email.text , password.text);
            print("=============================== Controller $response ") ;
            statusRequest = handlingData(response);
            if (StatusRequest.success == statusRequest) {
              if(response['status'] == "success")
              {
                myServices.sharedPreferences.setInt("user_id", response['data']['user_id']) ;
                myServices.sharedPreferences.setString("username", response['data']['username']) ;
                myServices.sharedPreferences.setString("email", response['data']['email']) ;
                myServices.sharedPreferences.setInt("phone", response['data']['phone']) ;
                myServices.sharedPreferences.setString("password", response['data']['password']) ;
                myServices.sharedPreferences.setString("type", response['data']['type']) ;

                myServices.sharedPreferences.setString("step", "2") ;

                // data.addAll(response['data']);
                Get.offNamed(AppRoute.homePage) ;

              }
              else {
                Get.defaultDialog(title: "warning" , middleText: "No user found for that email") ;
                statusRequest = StatusRequest.failure ;
              }
            }
            update();

          }catch (e){
           // statusRequest = StatusRequest.error ;
           // update() ;
            print(e);

          }


        }
        else {
          print("not valid");

        }


      }
    else{
      isInternet = false ;
      update();
    }


  }

  @override
  goToSignUp() {
  Get.offNamed(AppRoute.signup);
  }


  @override
  void onInit() {

    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  getAllData() async {
/*
    CollectionReference userref = FirebaseFirestore.instance.collection("users");
    QuerySnapshot querySnapshot = await userref.get() ;
    var listDec = querySnapshot.docs ;
    
    listDec.forEach((element) {
      print(element.data()) ;

    }) ;
*/
  }

  @override
  getUserData() {
    /*
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email.text)
        .get()
        .then((QuerySnapshot querySnapshot) {
         querySnapshot.docs.forEach((doc) {
         // print(doc["password"]);
         // print(doc["username"]);
         // print(doc["email"]);
         // print(doc["phone"]);
         myServices.sharedPreferences.setString("password", doc["password"]  ) ;
         myServices.sharedPreferences.setString("username",doc["username"] ) ;
         myServices.sharedPreferences.setString("email", doc["email"]) ;
         myServices.sharedPreferences.setString("phone",doc["phone"]) ;
         myServices.sharedPreferences.setString("step","2") ;
         myServices.sharedPreferences.setStringList("${doc["email"]}@@",[doc["username"] ,doc["password"]]) ;

      });

    });

    */
  }



}