import 'package:salon_project/data/model/ServicesModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/home/home_controller.dart';
import '../../../controller/services/services_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imagasset.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/EmployeesModel.dart';
import '../../widget/home/customappbar.dart';
import '../../widget/items/CustomItem.dart';

class Services extends GetView<ServicesControllerImp> {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(ServicesControllerImp());


    return Scaffold(
      body: GetBuilder<ServicesControllerImp>(
          builder: (controller) {
        return
          !controller.isSearch ?
          Container(
          padding: EdgeInsets.all(15),
          child: ListView(children: [
            CustomAppBar(
              titleappbar: "Find Service",
              onPressedIcon: () {Get.toNamed(AppRoute.favorite);},
              onPressedSearch: () {controller.onSearchItems();},
              onChanged: (val) {controller.checkSearch(val);},
              mycontroller: controller.search, isAdmin: false,),

            SizedBox(height: 20),
            HandlingDataView(
              statusRequest: controller.statusRequest ,
              widget:
               Column(
                children: [
                  Text(controller.employeesModel.nameEmp!,
                    style: const TextStyle(color: AppColor.black,
                        fontWeight: FontWeight.bold, fontSize: 30),),

                  SizedBox(height: 2,
                    child: Container(color: Colors.black,
                      margin: EdgeInsets.only(left: 70, right: 70),),),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 680,
                    child:
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.co_services.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, index) {
                          ServicesModel servicesModel = ServicesModel.fromJson(controller.co_services[index]);
                          print("============= ${servicesModel.idEmp} and ${controller.employeesModel.idEmp} \n") ;

                          return
                            InkWell(
                                onTap: () {
                                  controller.goToDetails(servicesModel) ;
                                },
                                child: CustomListItems(
                                  ImageUrl: "${AppImageAsset.rootImages}/${servicesModel.urlImage}",
                                  price: servicesModel.priceSer!,
                                  desc: servicesModel.nameSer!,
                                  tag: servicesModel.idSer!,
                                  active: '0',
                                  action: () {
                                    // controller.favorite(
                                    //     '${data['items_id']}',
                                    //     '${data['items_favorit']}',
                                    //     '${data['id_document']}'
                                    // );
                                  },


                                )

                            );



                        }),


                  ),
                ],
              ) ,)





          ]),
        ) :Container(
            margin: EdgeInsets.all(10),
            child: ListView(

              children: [

                CustomAppBar(
                  titleappbar: "Find Service",
                  onPressedIcon: () {Get.toNamed(AppRoute.favorite);},
                  onPressedSearch: () {controller.onSearchItems();},
                  onChanged: (val) {controller.checkSearch(val);},
                  mycontroller: controller.search, isAdmin: false,) ,
                SizedBox(height: 20,) ,

          ListItemsSearch(listdata: controller.listdata)

              ],
            ),
          ) ;

      }),
    );
  }
}


class ListItemsSearch extends GetView<HomeControllerImp> {
  final List listdata;
  const ListItemsSearch({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 680,
      child:
      GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: listdata.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.7),
          itemBuilder: (BuildContext context, index) {
            ServicesModel servicesModel = ServicesModel.fromJson(listdata[index]);

            return
              InkWell(
                  onTap: () {
                    controller.goToDetails(servicesModel) ;
                  },
                  child: CustomListItems(
                    ImageUrl: "${AppImageAsset.rootImages}/${servicesModel.urlImage}",
                    price: servicesModel.priceSer!,
                    desc: servicesModel.nameSer!,
                    tag: servicesModel.idSer!,
                    active: '0',
                    action: () {
                      // controller.favorite(
                      //     '${data['items_id']}',
                      //     '${data['items_favorit']}',
                      //     '${data['id_document']}'
                      // );
                    },

                  )

              );

          }),


    );
  }
}