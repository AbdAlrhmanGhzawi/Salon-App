import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import 'buttoncart.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final int? quantity ;
  final double? totalprice ;
  final Function()? runWhatsapp ;
  const BottomNavgationBarCart({Key? key, required this.quantity, required this.totalprice,required this.runWhatsapp, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("products quantity :", style: TextStyle(fontSize: 16, color: AppColor.primarySecandColor , fontWeight: FontWeight.bold))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$quantity", style: TextStyle(fontSize: 16 , color: AppColor.primarySecandColor, fontWeight: FontWeight.bold)))
              ],
            ),

            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Total Price",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$totalprice \$",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor)))
              ],
            ),
            SizedBox(height: 10),
            CustomButtonCart(
              textbutton: "Place Order",
              onPressed: runWhatsapp  ,

            )
          ],
        ));
  }
}