import 'package:salon_project/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/auth/login_controler.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imagasset.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/CustonTextFormAuth.dart';
import '../../widget/auth/customLottie.dart';
import '../../widget/auth/customTextSignup.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
     Get.put(LoginControlerImp());
    int x  = Get.arguments!=null ? Get.arguments : 0;
    StatusRequest statusRequest ;
    return  Scaffold(
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: AppColor.white ,
        elevation: 0.0,
        title:  Text('Log In' , style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey) ),
      ),
        body :
        GetBuilder<LoginControlerImp>(
        builder: (controller) =>
        !controller.isInternet ? const CustomLottie() :
        WillPopScope(
          onWillPop:() async {
          return alertExitApp();
          },
          child:
          HandlingDataRequest(statusRequest: controller.statusRequest!
            , widget: Container(
              //padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
              child: Form(
                key: controller.formstate,
                child: ListView(children:  [
                  SizedBox(height: 20),
                  LogoAuth(),
                  SizedBox(height: 20),

                  CustomTextTitleAuth(text: "Welcome Back"),
                  SizedBox(height: 5),
                  CustomTextBodyAuth(
                      text: x!=null && x == 1  ?
                      "Verification has been sent to your email, please verify your account and then register"
                          : "log in With Your Email And Password OR Continue With Social Media" ),
                  SizedBox(height: 40),
                  CustomTextFormAuth(
                    isnumber: false,
                    valid: (val){
                      return validInput(val! , 5 , 30 ,"email" );
                    },
                    mycontroller: controller.email,
                    hinttext: "Enter Your Email",
                    iconData: Icons.email_outlined,
                    labeltext: "Email",
                    // mycontroller: ,
                  ),
                  SizedBox(height: 15),
                  GetBuilder<LoginControlerImp>(
                    builder: (controller)=> CustomTextFormAuth(
                      isnumber: false,
                      valid: (val){

                        return validInput(val! , 3 , 30 ,"password" );
                      },
                      obscureText: controller.isshowpassword,
                      onTapIcon: (){
                        controller.showPassword() ;
                      },
                      mycontroller: controller.password,
                      hinttext: "Enter Your Password",
                      iconData: Icons.lock_outline,
                      labeltext: "Password",
                      // mycontroller: ,
                    ),
                  ) ,



                  SizedBox(height: 30),

                  CustomButtomAuth(text: "log in",onPressed: (){
                    controller.login(context);
                  }),
                  SizedBox(height: 30),

                  CustomTextSignup(textone: "Don't have an account ? ",texttwo: "Sign Up" ,
                    onTap:(){controller.goToSignUp(); } , )


                ]),
              ),
            ),)

        ),
      ),
    );
  }


}



