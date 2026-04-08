import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/employeesdetails_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imagasset.dart';

class TopProductPageDetails extends GetView<EmployeesDetailsControllerImp> {

  final String ImageUrl ;
  final String itemId ;

  const TopProductPageDetails(this.ImageUrl, this.itemId, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container
      (
      height: 300,
      child: Hero(
      tag: itemId ,
      child:  Image.asset(ImageUrl , fit: BoxFit.cover,)
      // CachedNetworkImage(
      //   imageUrl:
      //   ImageUrl,
      //   height: 250,
      //   fit: BoxFit.fill,
      // ),
    ),

    ) ;
  }
}