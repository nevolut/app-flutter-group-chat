import 'package:chat_app/theme/colors.dart';
import 'package:chat_app/util/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multiavatar/multiavatar.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage(this.name, {this.width = 100, this.height = 100, this.bgColor = white, this.borderWidth = 0, this.borderColor = white});
  final String name;
  final double width;
  final double height;
  final double borderWidth;
  final Color borderColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return
      Container(width: width, height: height,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: borderWidth), 
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.string(multiavatar(name)),
      );
  }
}