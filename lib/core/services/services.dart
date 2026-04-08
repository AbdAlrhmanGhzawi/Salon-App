import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{

  late SharedPreferences sharedPreferences ;

  Future<MyServices> init() async {

    //start
    sharedPreferences = await SharedPreferences.getInstance();

    //end
    return this ;

  }
}

initialServices() async {

  await Get.putAsync(() => MyServices().init());

}