import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/services/services_controller.dart';
import '../../../core/constant/color.dart';

class ListCategoriesItems extends GetView<ServicesControllerImp> {
    ListCategoriesItems({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Text("services") ;
        },
      ),
    );
  }
}

