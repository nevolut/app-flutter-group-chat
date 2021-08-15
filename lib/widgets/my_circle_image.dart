import 'package:chat_app/theme/colors.dart';
import 'package:flutter/material.dart';

class MyCircleImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final double borderWidth;
  final Color borderColor;
  final Color bgColor;

  const MyCircleImage(this.image, {this.width = 100, this.height = 100, this.bgColor = white, this.borderWidth = 0, this.borderColor = white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: borderWidth, color: borderColor),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar( 
        foregroundImage: NetworkImage(image),
        backgroundImage: AssetImage("assets/images/default.jpg"),
        backgroundColor: white,
      ),
    );
  }
}