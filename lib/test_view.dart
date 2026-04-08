import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'controller/test.dart';
import 'core/class/handlingdataview.dart';
import 'core/constant/color.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Test());
    return MaterialApp(
        title: 'test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: GetBuilder<Test>(builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.myController,
                          ),
                        ),
                        MaterialButton(onPressed: controller.addToList,child: Text("add"),)
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.list.length,
                        itemBuilder: (context, i) {
                          return Text(controller.list[i]);
                        }),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
