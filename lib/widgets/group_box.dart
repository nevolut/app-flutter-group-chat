
import 'package:chat_app/theme/colors.dart';
import 'package:chat_app/util/global.dart';
import 'package:flutter/material.dart';

import 'my_button.dart';

class GroupBox extends StatelessWidget {
  const GroupBox(this.groupData) ;
  final groupData;

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 250,
          height: 300,
          decoration: BoxDecoration(
            color: white,
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
          child: Column(
            children: [
              Container(
                  width: 270,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    image: DecorationImage(image: getDisplayImage(groupData["image"]), fit: BoxFit.cover)
                  ),
                ),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: EdgeInsets.all(10),
                  child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(groupData["name"], maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                        SizedBox(height: 5,),
                         Text( groupData["numMembers"].toString() + " members", maxLines: 1, overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: grey),),
                          SizedBox(height: 10,),
                      ],
                    ),
                ),
              ),
              Container(
                height: 60,
                  padding: EdgeInsets.all(10),
                  // color: black,
                            alignment: Alignment.center,
                            child: 
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: MyButton(onTap: (){
                              
                                  },
                                  title: "Join",
                                  height: 35,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: MyButton(onTap: (){
                              
                                  },
                                  title: "Preview",
                                  bgColor: grey,
                                  height: 35,
                                ),
                              ),
                            ],
                          ),
                      ),
            ],
          ),
        );
  }
}