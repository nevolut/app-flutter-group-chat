
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  const MyDivider({Key? key,  required this.color, this.thickness = 0.3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: Divider(thickness: thickness, color: color, height: 2,)
    );
  }
}