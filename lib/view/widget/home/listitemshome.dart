
import 'package:salon_project/data/model/EmployeesModel.dart';
import 'package:salon_project/data/model/ServicesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imagasset.dart';
import '../../../linkapi.dart';

class ListServicesHome extends GetView<HomeControllerImp> {

  final int flag ;

  const ListServicesHome( {Key? key , required this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerImp = Get.put(HomeControllerImp());
    return SizedBox(
      height: 140,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: flag == 0 ? controller.services.length : controller.offerServices.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ServicesHome(
                servicesModel: ServicesModel.fromJson(flag == 0?controller.services[i]:controller.offerServices[i]),
                flag: flag,
                onTap: () {
                  controllerImp.goToServicesDetails(ServicesModel.fromJson(flag == 0?controller.services[i]:controller.offerServices[i]) , flag);

                },);
          }),
    );
  }
}

class ServicesHome extends StatelessWidget {
  final ServicesModel servicesModel;
  final flag ;
  final void Function()? onTap ;
   ServicesHome({Key? key,required this.flag , required this.servicesModel , required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap ,
        child:
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Hero(tag: flag == 0 ? '${servicesModel.idSer}S' : '${servicesModel.idSer}SS' ,
              child: Image.asset("${AppImageAsset.rootImages}/${servicesModel.urlImage}" ,height: 100,width: 150, fit: BoxFit.fill,)

              ),
            ),

            Container(
              decoration: BoxDecoration(
                  color: AppColor.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)),
              height: 120,
              width: 200,
            ),
            Positioned(
                left: 10,
                child: Text(
                  "${servicesModel.nameSer}",
                  style: const TextStyle(
                      color: Colors.white,
                       fontWeight: FontWeight.bold,
                      fontSize: 14),
                )
            )
          ],
        ),
      ),
    );
  }
}
