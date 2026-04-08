import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/services/services.dart';



class custom_items extends StatelessWidget {
  final String ImageUrl ;
  final void Function()? add ;
  final void Function()? delete ;


  const custom_items( { Key? key , required this.ImageUrl , required this.add,required this.delete }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        width: 165,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0)),
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  CachedNetworkImage(
                      imageUrl: ImageUrl,
                      height: 75,
                      fit: BoxFit.fill,
                    ),

                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      IconButton(
                          onPressed: delete ,
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                            size: 40,
                          )) ,

                      IconButton(
                          onPressed: add ,
                          icon: Icon(
                            Icons.add_box_outlined,
                            color: Colors.green,
                            size: 40,

                          ))
                    ],
                  )
                ]),
          ),
        ),
      );
  }
}