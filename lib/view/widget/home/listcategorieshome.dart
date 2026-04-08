
import 'package:salon_project/core/constant/imagasset.dart';
import 'package:salon_project/data/model/EmployeesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class ListEmployeesHome extends GetView<HomeControllerImp> {
  const ListEmployeesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.employees.length ,
        scrollDirection: Axis.horizontal ,
        itemBuilder: (context, index) {

          return
            Employees(
              i: index,
              employeesModel:
              EmployeesModel.fromJson(controller.employees[index]),
          );

        },
      ),
    );
  }
}

class Employees extends GetView<HomeControllerImp> {
  final   EmployeesModel employeesModel;
  final int? i;
  const Employees({Key? key, required this.employeesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        controller.goToPageProductDetails(employeesModel) ;
        //controller.goToItems(controller.categories, i! , categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(

            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(

                color: AppColor.primaryThreeColor,
                borderRadius: BorderRadius.circular(20)

                ),
           // padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            width: 80,
            child: Hero(tag: '${employeesModel.idEmp}E' ,
            child: Image.asset("${AppImageAsset.rootImages}/${employeesModel.urlImage}" , fit: BoxFit.cover,)) ,

             // SvgPicture.asset( AppImageAsset.logo ,
             //     "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
             //    color: AppColor.primarySecandColor),
           ),
          Text( "${employeesModel.nameEmp}" ,
            //"${translateDatabase(categoriesModel.categoriesNamaAr, categoriesModel.categoriesName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}
