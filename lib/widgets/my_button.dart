import 'package:chat_app/theme/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({ Key? key, required this.onTap, this.title = "", this.height = 45, this.bgColor = primary, this.icon = Icons.cancel_presentation_outlined }) : super(key: key);
  final GestureTapCallback onTap;
  final String title;
  final double height;
  final Color bgColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: this.bgColor,
                                      ),
                                      height: this.height,
                                      child: 
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: (this.icon == Icons.cancel_presentation_outlined) ?
                                        [
                                          Text(this.title, style: TextStyle(color: white, fontWeight: FontWeight.w600),)
                                        ]:
                                        [
                                          Icon(icon, size: 23, color: white,),
                                          SizedBox(width: 5,),
                                          Text(this.title, style: TextStyle(color: white, fontWeight: FontWeight.w600),)
                                        ]
                                      )
                                    ),
      );
  }
}