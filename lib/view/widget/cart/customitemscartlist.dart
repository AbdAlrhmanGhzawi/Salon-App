import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imagasset.dart';

class CustomItemsCartList extends GetView {
  final String name ;
  final String price  ;
  final String count   ;
  final String imageUrl ;
  final Function()? delete ;
   CustomItemsCartList( {Key? key, required this.name, required this.price, required this.count, required this.imageUrl ,required this.delete,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Card(
        child: Container(
          child: Row(children: [
            Container(
              height: 130,
              width: 130,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                // placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error),
              ),
            ),
            SizedBox(width: 20,) ,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: AppColor.black)),
                Text(price, style: TextStyle(color: AppColor.primaryColor, fontSize: 17 , fontWeight: FontWeight.bold)),

        ]) ,


          ]),
        ),
      ),

       Positioned(
          top: 10,
          bottom: 40,
          left: 300,


          child:InkWell(
            onTap: delete
            , child: Icon(Icons.delete_outline , color: Colors.red,size: 30 ,), )   )

      ],
    );
  }
}