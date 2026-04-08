
import 'package:salon_project/core/constant/imagasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/services/servicesdetails_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/productdetails/priceandcount.dart';
import '../../widget/productdetails/subitemslist.dart';
import '../../widget/productdetails/toppageproductdetails.dart';

class ServicesDetails extends StatelessWidget {
  const ServicesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ServicesDetailsControllerImp controllerImp = Get.put(ServicesDetailsControllerImp());
        
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.primarySecandColor,
                onPressed: () {

                  controllerImp.goToBooking();
                },
                child: const Text(
                  "Book the service",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ServicesDetailsControllerImp>(
            builder: (controller) => ListView(children: [
                  TopProductPageDetails("${AppImageAsset.rootImages}/${controller.servicesModel.urlImage}" , controller.flag == 0 ? '${controller.servicesModel.idSer!}S': '${controller.servicesModel.idSer!}SS' ),
                  const SizedBox(
                    height: 20,
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: Text("${controller.servicesModel.nameSer}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                  color: AppColor.primaryColor,
                                ),
                              ),) ,
                              SizedBox(height: 20,) ,
                              Text("price :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                    color: AppColor.primaryfourthColor,
                                  )),
                              SizedBox(height: 10,) ,
                              Row(children: [
                                Icon(Icons.price_change_outlined,color: AppColor.primarySecandColor,) ,
                                SizedBox(width: 20,) ,
                                Text(" ${controller.servicesModel.priceSer} \$"
                                    ,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: AppColor.grey2))
                              ],) ,
                              SizedBox(height: 10,) ,

                              Text("Description :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        color: AppColor.primaryfourthColor,
                                      )),
                              const SizedBox(height: 10),

                              Text("${controller.servicesModel.description}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: AppColor.grey2)),
                              const SizedBox(height: 20),

                              Text("Max Time :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                    color: AppColor.primaryfourthColor,
                                  )),
                              const SizedBox(height: 10),

                              Row(children: [
                                Icon(Icons.timer_outlined,color: AppColor.primarySecandColor,) ,
                                SizedBox(width: 20,) ,
                                Text(" ${controller.servicesModel.maxTime} Minute",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: AppColor.grey2))
                              ],) ,
                              const SizedBox(height: 20),



                            ]),
                      ))
                ])));
  }
}
