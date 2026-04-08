
import 'package:flutter/cupertino.dart' ;
import 'package:flutter/material.dart' ;
import '../../../core/constant/color.dart' ;

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid ;
  final bool isnumber ;
  final bool? obscureText;
  final void Function()? onTapIcon ;
  const CustomTextFormAuth(
      {Key? key,
        this.obscureText,
        this.onTapIcon,
        required this.hinttext,
        required this.labeltext,
        required this.iconData,
        required this.mycontroller,
        required this.valid, required this.isnumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: const EdgeInsets.only(left: 15 , right: 15 , bottom: 10),
      child: TextFormField(
        keyboardType: isnumber ? TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
        validator: valid ,
        controller: mycontroller ,
        obscureText: obscureText == null || obscureText == false  ? false : true ,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14,color: AppColor.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)),
            suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),

    );
  }
}