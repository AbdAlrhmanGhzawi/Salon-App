import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/services/services.dart';



class CustomFavorite extends StatelessWidget {
  final String ImageUrl ;
  final int price ;
  final String desc ;
  final String tag ;



  const CustomFavorite( { Key? key , required this.ImageUrl, required this.price, required this.desc, required this.tag }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0)),
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: '${tag}',
                    child: CachedNetworkImage(
                      imageUrl: ImageUrl,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 10) ,
                  Text( '${desc}'  ,
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),

                  Center(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    child :
                      Text("${price}\ S.P",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),

                  ) ,

                  SizedBox(height: 10,) ,

                ]),
          ),
        ),
      );
  }
}