import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String message ;
  final int count ;
  final int type ;
  const TopCardCart({Key? key, required this.message, required this.count, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 125.0,
        width: (MediaQuery.of(context).size.width / 2.0) - 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Icon(Icons.icecream_rounded) ,
            ),
            SizedBox(height: 2.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text( message,
                  style: TextStyle(
                    fontFamily: 'GilroyHeavy',
                    fontSize: 15.0,
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 3.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('${count}',
                  style: TextStyle(
                      fontFamily: 'GilroyHeavy',
                      fontSize: 15.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}