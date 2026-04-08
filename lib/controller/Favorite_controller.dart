import 'package:get/get.dart';

import '../core/constant/routes.dart';

abstract class Favorite_controller extends GetxController {
  intialData();
  goToDetails(String id , String imageurl, String des  ,String itemName , int price);


}

class Favorite_controllerImp extends Favorite_controller {




  @override
  void onInit() {
    intialData();

    super.onInit();
  }

  @override
  intialData() {

  }

  @override
  goToDetails(String id , String imageurl, String des  ,String itemName , int price) {

    Get.toNamed(AppRoute.EmployeeDetails ,
        arguments: {
          "itemId" : id ,
          "imageUrl" : imageurl ,
          "description" : des ,
          "itemName" : itemName ,
          "itemPrice" : price ,
        }
    );

  }








}