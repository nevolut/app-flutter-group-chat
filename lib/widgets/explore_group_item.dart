import 'package:chat_app/theme/colors.dart';
import 'package:chat_app/widgets/my_circle_image.dart';
import 'package:flutter/material.dart';

import 'my_divider.dart';

class ExploreGroupItem extends StatelessWidget {
  const ExploreGroupItem(this.groupData);
  final groupData;
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 15, right: 10, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: MyCircleImage(groupData['image'], width: 60, height: 60,),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 8,
                    child: 
                    Container(
                      child:
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            new Row(
                                  children: <Widget>[
                                    Container(
                                        child: Text(groupData['name'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))
                                      )
                                  ],
                            ),
                            SizedBox(height: 3,),
                            new Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: Text(groupData['numMembers'].toString() + " members", maxLines: 1, overflow: TextOverflow.ellipsis, 
                                          style: TextStyle(fontSize: 14, color: black)
                                        )
                                      )
                                    ),
                                  ],
                            ),
                            SizedBox(height: 3,),
                            new Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: Text("Anxiety", maxLines: 1, overflow: TextOverflow.ellipsis, 
                                          style: TextStyle(fontSize: 14, color: grey))
                                      )
                                    ),
                                  ],
                            ),
                            MyDivider(color: grey)
                          ],
                        )
                    )
                  ),
                ],
              ),
            );
  }
}