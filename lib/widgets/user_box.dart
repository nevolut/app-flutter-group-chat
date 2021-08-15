
import 'package:chat_app/theme/colors.dart';
import 'package:chat_app/util/global.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/user_avatar_image.dart';
import 'package:flutter/material.dart';

class UserBox extends StatelessWidget {
  final Map<String, dynamic> user;
  const UserBox({ Key? key, required this.user }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 180,
                  height: 215,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: 
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/user", arguments: {"user": user});
                      },
                      child:
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 5,),
                            UserAvatarImage(user['anonName'], width: 65, height: 65,),
                            SizedBox(height: 12,),
                            Text(user['anonName'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,)),
                            SizedBox(height: 12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.timeline_outlined, size: 18, color: primary,),
                                SizedBox(width: 5,),
                                Flexible(
                                  child: Container(
                                    child: Text(getArrayString(user["topics"]), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 5,),
                                Expanded(child: 
                                  MyButton(onTap: (){
                                    },
                                    bgColor: lightRed,
                                    height: 30,
                                    icon: Icons.close,
                                  )
                                ),
                                SizedBox(width: 7,),
                                Expanded(child: 
                                  MyButton(onTap: (){
                                    }, 
                                    bgColor: primary,
                                    height: 30,
                                    icon: Icons.check,
                                  )
                                ),
                                SizedBox(width: 5,),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                );
  }
}