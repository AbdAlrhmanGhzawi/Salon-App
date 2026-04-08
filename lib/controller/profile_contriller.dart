
import 'package:salon_project/core/constant/color.dart';
import 'package:salon_project/core/constant/imagasset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/dialogueConfirm.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/functions/validinput.dart';
import '../core/services/services.dart';
import '../data/datatsource/remote/profile/deletAccount.dart';
import '../data/datatsource/remote/profile/editInfo.dart';
import '../view/widget/auth/CustonTextFormAuth.dart';
import '../view/widget/auth/custombuttonauth.dart';


abstract class profile_controller extends GetxController {
  log_out() ;
  deletAccount() ;
  EditAccount() ;
  ConfirmPassword() ;
  cancel() ;
  confirm() ;

}

class profile_controllerImp extends profile_controller {


  String? email , username  ;
  late final   user_id   , phone ;
  MyServices myServices = Get.find() ;



  DeletAccount logInData = DeletAccount(Get.find()) ;
  EditInfo editInfo = EditInfo(Get.find());
  List data = [];
  StatusRequest? statusRequest = StatusRequest.none;


  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController Inputemail ;
  late TextEditingController InputNewemail ;
  late TextEditingController Inputpassword ;
  late TextEditingController Inputphone ;
  late TextEditingController Inputusername ;
  late TextEditingController Inputaddress ;

  late TextEditingController DeletePassword ;

  bool isEdit = false  , isConfirm = false;


  @override
  void onInit() {
    intialData();

    super.onInit();
  }

  @override
  void dispose() {
    Inputemail.dispose();
    InputNewemail.dispose() ;
    Inputpassword.dispose();
    Inputphone.dispose();
    Inputusername.dispose();
    Inputaddress.dispose();
    DeletePassword.dispose();
    super.dispose();
  }

  @override
  intialData() {
    email = myServices.sharedPreferences.getString("email") ;
    username = myServices.sharedPreferences.getString("username") ;
    user_id = myServices.sharedPreferences.getInt("user_id") ;
    phone = myServices.sharedPreferences.getInt("phone") ;

    Inputemail = TextEditingController();
    InputNewemail = TextEditingController();
    Inputpassword = TextEditingController();
    Inputphone = TextEditingController();
    Inputusername = TextEditingController();
    Inputaddress = TextEditingController();
    DeletePassword = TextEditingController();

  }

  @override
  log_out() {
    
    dialogueConfirm("Do you want to log out?", () {

    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login) ;
    })  ;
  }


  @override
  deletAccount() async {

    Get.dialog(
        Center(
          child: Dialog(
              elevation: 50,
              child: Container(
                  width: 130,
                  height: 250,
                  child: Container(
                    //padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
                    child: Form(
                      key: formstate,
                      child:  ListView(children: [
                        SizedBox(height: 30),


                        CustomTextFormAuth(
                          isnumber: false,
                          valid: (val) {
                            return validInput(
                                val!, 3, 30, "password");
                          },
                          mycontroller: DeletePassword ,
                          hinttext: "Enter your password",
                          iconData: Icons.lock_person_outlined,
                          labeltext: "Confirm the delete your account",
                          // mycontroller: ,
                        ),
                        SizedBox(height: 30),
                        CustomButtomAuth(
                            text: "delete",
                            onPressed: () async {
                            String? yourPassword = myServices.sharedPreferences.getString("password");

                              if(yourPassword == DeletePassword.text){

                                try{

                                  statusRequest = StatusRequest.loading;
                                  update();
                                  var response = await logInData.postData(email! , phone.toString());
                                  print("=============================== Controller $response ") ;
                                  statusRequest = handlingData(response);
                                  if (StatusRequest.success == statusRequest) {
                                    if(response['status'] == "success")
                                    {
                                      Get.snackbar(
                                        'Administration',
                                        'The account has been successfully deleted',
                                        duration: Duration(seconds: 3), // Set the duration to 3 seconds
                                        backgroundColor: Colors.green , // Set the background color to green
                                        colorText: Colors.white, // Set the text color to white
                                        icon: Icon(Icons.delete_sweep_outlined, color: Colors.white), // Add an icon
                                        shouldIconPulse: true, // Make the icon pulse
                                        snackPosition: SnackPosition.BOTTOM, // Set the position to bottom
                                      );
                                      myServices.sharedPreferences.clear();
                                      Get.offAllNamed(AppRoute.login) ;
                                      // data.addAll(response['data']) ;
                                    }
                                    else {
                                      Get.defaultDialog(title: "warning" , middleText: "An error occurred while deleting the account") ;
                                      statusRequest = StatusRequest.failure ;
                                    }
                                  }
                                  update();

                                }catch (e){
                                  // statusRequest = StatusRequest.error ;
                                  // update() ;
                                  print(e);

                                }

                              }else {

                                Get.snackbar(
                                  'Profile',
                                  'the password is wrong',
                                  duration: Duration(seconds: 3), // Set the duration to 3 seconds
                                  backgroundColor: Colors.red , // Set the background color to green
                                  colorText: Colors.white, // Set the text color to white
                                  icon: Icon(Icons.delete_sweep_outlined, color: Colors.white), // Add an icon
                                  shouldIconPulse: true, // Make the icon pulse
                                  snackPosition: SnackPosition.BOTTOM, // Set the position to bottom
                                );


                              }

                            }),
                        SizedBox(height: 5),
                        CustomButtomAuth(
                            text: "cancel",
                            onPressed: () async {
                             cancel();
                            }),
                        SizedBox(height: 30),
                      ])

                    ),
                  ))),
        )

    ) ;

  }

  @override
  EditAccount() {
    isEdit = true ;
    update() ;
  }

  @override
  ConfirmPassword() {

    var formdata= formstate.currentState ;
    if(formdata!.validate())
    {
      isConfirm = true ;
      update() ;
    }


  }

  @override
  cancel() {
    isConfirm = false ;
    isEdit = false ;
    Inputemail.clear() ;
    InputNewemail.clear();
    Inputaddress.clear() ;
    Inputusername.clear() ;
    Inputpassword.clear();
    DeletePassword.clear();
    Get.back();

    update() ;
  }

  @override
  confirm() async {

    try{

      statusRequest = StatusRequest.loading;
      update();
      var response = await editInfo.postData(Inputusername.text,InputNewemail.text,Inputemail.text,Inputpassword.text , Inputaddress.text);
      print("=============================== Controller $response ") ;
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if(response['status'] == "success")
        {
          Get.snackbar(
            'Administration',
            'Your personal data has been modified',
            duration: Duration(seconds: 3), // Set the duration to 3 seconds
            backgroundColor: Colors.green , // Set the background color to green
            colorText: Colors.white, // Set the text color to white
            icon: Icon(Icons.delete_sweep_outlined, color: Colors.white), // Add an icon
            shouldIconPulse: true, // Make the icon pulse
            snackPosition: SnackPosition.BOTTOM, // Set the position to bottom
          );
          myServices.sharedPreferences.setString("username", Inputusername.text ) ;
          myServices.sharedPreferences.setString("email", InputNewemail.text ) ;

          email = myServices.sharedPreferences.getString("email") ;
          username = myServices.sharedPreferences.getString("username") ;

          isEdit = false ;
          cancel() ;

          // data.addAll(response['data']);
        }
        else {
          Get.defaultDialog(title: "warning" , middleText: "Verify your password or email") ;
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

}