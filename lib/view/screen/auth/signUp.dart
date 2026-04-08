
import 'package:salon_project/core/class/statusrequest.dart';
import 'package:salon_project/core/constant/imagasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/auth/signup_controler.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/CustonTextFormAuth.dart';
import '../../widget/auth/customTextSignup.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControlerImp());
    return  Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white ,
        elevation: 0.0,
        title:  Text('Sign Up' , style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey) ),
      ),
      body: WillPopScope(
        onWillPop:() async {
          return alertExitApp();
        },
        child: GetBuilder<SignUpControlerImp>(builder: (controller) =>
            HandlingDataRequest(statusRequest: controller.statusRequest!
          , widget:  Container(
              //padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
              child: Form(
                key: controller.formstate,
                child: ListView(children:  [
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  CustomTextTitleAuth(text: "Welcome Back"),
                  SizedBox(height: 5),
                  CustomTextBodyAuth(
                      text: "log in With Your Email And Password OR Continue With Social Media"),
                  SizedBox(height: 40),
                  CustomTextFormAuth(
                    isnumber: false,
                    valid: (val){
                      return validInput(val! , 3 , 30 ,"username" );
                    },
                    mycontroller: controller.username,
                    hinttext: "Enter Your Username",
                    iconData: Icons.person_outline,
                    labeltext: "Username",
                    // mycontroller: ,
                  ),

                  SizedBox(height: 15),
                  CustomTextFormAuth(
                    isnumber: false,
                    valid: (val){
                      return validInput(val! , 5 , 100 ,"email" );
                    },
                    mycontroller: controller.email,
                    hinttext: "Enter Your Email",
                    iconData: Icons.email_outlined,
                    labeltext: "Email",
                    // mycontroller: ,
                  ),
                  SizedBox(height: 15),
                  CustomTextFormAuth(
                    isnumber: true,
                    valid: (val){
                      return validInput(val! , 9 , 11 ,"phone" );
                    },
                    mycontroller: controller.phone,
                    hinttext: "Enter Your Phone",
                    iconData: Icons.phone_outlined,
                    labeltext: "Phone",
                    // mycontroller: ,
                  ),
                  SizedBox(height: 15),
                  CustomTextFormAuth(
                    isnumber: false,
                    valid: (val){

                      return validInput(val! , 5 , 30 ,"password" );

                    },
                    mycontroller: controller.password,
                    hinttext: "Enter Your Password",
                    iconData: Icons.lock_outline,
                    labeltext: "Password",
                    // mycontroller: ,
                  ),

                  SizedBox(height: 30),

                  CustomTextFormAuth(
                    isnumber: false,
                    valid: (val){

                      return validInput(val! , 5 , 30 ,"address" );

                    },
                    mycontroller: controller.address,
                    hinttext: "Enter Your address",
                    iconData: Icons.location_on_outlined,
                    labeltext: "address",
                    // mycontroller: ,
                  ),

                  SizedBox(height: 30),

                  CustomButtomAuth(text: "Sign Up",onPressed: () async{
                    await controller.signUp(context);

                  }),
                  SizedBox(height: 30),

                  CustomTextSignup(textone: "have an account ? ",texttwo: "Log In" ,
                      onTap:(){controller.goToLogIn(); } )

                ]),
              ),
            ) )



          )
      ),
    );
  }
}