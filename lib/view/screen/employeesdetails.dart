
import 'package:salon_project/core/constant/imagasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/employeesdetails_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../widget/productdetails/priceandcount.dart';
import '../widget/productdetails/subitemslist.dart';
import '../widget/productdetails/toppageproductdetails.dart';
import 'package:clipboard/clipboard.dart';


class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    EmployeesDetailsControllerImp controllerImp = Get.put(EmployeesDetailsControllerImp());
        
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.primarySecandColor,
                onPressed: () {
                  controllerImp.viewServices() ;
                 // Get.toNamed(AppRoute.cart);
                },
                child: const Text(
                  "veiw services",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<EmployeesDetailsControllerImp>(
            builder: (controller) => ListView(children: [
                   TopProductPageDetails("${AppImageAsset.rootImages}/${controller.employeesModel.urlImage}" , '${controller.employeesModel.idEmp!}E'),
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
                              Center(child: Text("${controller.employeesModel.nameEmp}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                  color: AppColor.primaryColor,
                                ),
                              ),) ,
                              SizedBox(height: 20,) ,
                              Text("Contact :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                    color: AppColor.primaryfourthColor,
                                  )),
                              SizedBox(height: 10,) ,
                              Row(children: [
                                Icon(Icons.call_end_outlined,color: AppColor.primarySecandColor,) ,
                                SizedBox(width: 20,) ,
                                Text(" ${controller.employeesModel.phone}") ,
                                Spacer() ,
                                InkWell(
                                  onTap: (){
                                    Clipboard.setData(ClipboardData(text: controller.employeesModel.phone!));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('تم نسخ رقم الهاتف'),
                                      ),
                                    );
                                  },
                                  child: Icon(Icons.copy_all_outlined),
                                )

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
                              // PriceAndCountItems(
                              //     onAdd: () {
                              //      // controller.add();
                              //     },
                              //     onRemove: () {
                              //    //   controller.remove();
                              //     },
                              //     price: 1500 ,
                              //        // "${controller.employeesModel.idEmp}",
                              //     count: "${controller.countitems}"),
                              // const SizedBox(height: 10),
                              Text("${controller.employeesModel.description}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: AppColor.grey2)),
                              const SizedBox(height: 20),



                            ]),
                      ))
                ])));
  }
}
