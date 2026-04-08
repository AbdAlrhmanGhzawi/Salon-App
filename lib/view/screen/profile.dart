import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/profile_contriller.dart';
import '../../core/constant/color.dart';
import '../../core/functions/validinput.dart';
import '../widget/auth/CustonTextFormAuth.dart';
import '../widget/auth/custombuttonauth.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(profile_controllerImp());

    return Scaffold(
        body: GetBuilder<profile_controllerImp>(
      builder: (controller) => controller.isEdit == true
          ? Center(
              child: Dialog(
                  elevation: 50,
                  child: Container(
                      width: 120,
                      height: 250,
                      child: Container(
                        //padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
                        child: Form(
                          key: controller.formstate,
                          child: controller.isConfirm == false
                              ? ListView(children: [
                                  SizedBox(height: 5),
                                  CustomTextFormAuth(
                                    isnumber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 3, 30, "username");
                                    },
                                    mycontroller: controller.Inputusername,
                                    hinttext: "Enter Your Username",
                                    iconData: Icons.person_outline,
                                    labeltext: "New Username",
                                    // mycontroller: ,
                                  ),
                                  SizedBox(height: 15),
                                  CustomTextFormAuth(
                                    isnumber: false,
                                    valid: (val) {
                                      return validInput(val!, 5, 30, "address");
                                    },
                                    mycontroller: controller.Inputaddress,
                                    hinttext: "Enter Your address",
                                    iconData: Icons.location_on_outlined,
                                    labeltext: "New Address",
                                    // mycontroller: ,
                                  ),
                                  SizedBox(height: 30),
                                  CustomTextFormAuth(
                                    isnumber: false,
                                    valid: (val) {
                                      return validInput(val!, 5, 100, "email");
                                    },
                                    mycontroller: controller.Inputemail,
                                    hinttext: "Enter Your Email",
                                    iconData: Icons.email_outlined,
                                    labeltext: "Email",
                                    // mycontroller: ,
                                  ),
                                  SizedBox(height: 30),
                                  CustomTextFormAuth(
                                    isnumber: false,
                                    valid: (val) {
                                      return validInput(val!, 5, 100, "email");
                                    },
                                    mycontroller: controller.InputNewemail,
                                    hinttext: "Enter Your New Email",
                                    iconData: Icons.email_outlined,
                                    labeltext: "New Email",
                                    // mycontroller: ,
                                  ),
                                  SizedBox(height: 30),
                                  CustomButtomAuth(
                                      text: "Edit info",
                                      onPressed: () async {
                                        controller.ConfirmPassword();
                                      }),
                                  SizedBox(height: 5),
                                  CustomButtomAuth(
                                      text: "cancel",
                                      onPressed: () async {
                                        controller.cancel();
                                      }),
                                  SizedBox(height: 30),
                                ])
                              : ListView(children: [
                                  SizedBox(height: 5),
                                  CustomTextFormAuth(
                                    isnumber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 3, 30, "password");
                                    },
                                    mycontroller: controller.Inputpassword,
                                    hinttext: "Enter your password",
                                    iconData: Icons.lock_person_outlined,
                                    labeltext: "Confirm the modification",
                                    // mycontroller: ,
                                  ),
                                  SizedBox(height: 20),
                                  CustomButtomAuth(
                                      text: "Confirm",
                                      onPressed: () async {
                                        controller.confirm();
                                      }),
                                  SizedBox(height: 5),
                                  CustomButtomAuth(
                                      text: "Cancel",
                                      onPressed: () async {
                                        controller.cancel();
                                      }),
                                  SizedBox(height: 15),
                                ]),
                        ),
                      ))),
            )
          : ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 210.0,
                          width: double.infinity,
                          color: AppColor.primaryColor,
                        ),
                        Positioned(
                          bottom: 50.0,
                          right: 100.0,
                          child: Container(
                            width: 400.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200.0),
                                color: AppColor.primarySecandColor
                                    .withOpacity(0.5)),
                          ),
                        ),
                        Positioned(
                          bottom: 100.0,
                          left: 150.0,
                          child: Container(
                            width: 300.0,
                            height: 300.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200.0),
                                color: AppColor.primarySecandColor
                                    .withOpacity(0.5)),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width: 75.0,
                                  height: 75.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2.0),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/image/avotar.jpg'))),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(controller.username!,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Quicksand',
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("Email : ${controller.email!}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Quicksand',
                                            fontSize: 10)),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 250.0,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Card(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ListTile(
                          onTap: () {
                            controller.log_out();
                          },
                          title: Text(
                            "Logout",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          trailing: const Icon(
                            Icons.exit_to_app,
                            color: Colors.red,
                          ),
                        ),
                      ]),
                    ),
                    Card(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ListTile(
                          onTap: () {
                            controller.deletAccount();
                          },
                          title: Text(
                            "delete account",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          trailing: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ]),
                    ),
                    Card(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ListTile(
                          onTap: () {
                            controller.EditAccount();
                          },
                          title: Text(
                            "Modify account information",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          trailing: const Icon(
                            Icons.edit_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ]),
                    ),
                  ],
                )
              ],
            ),
    ));
  }
}
