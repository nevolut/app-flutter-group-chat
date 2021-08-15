
import 'package:chat_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'my_divider.dart';
import 'my_circle_image.dart';

class GroupItem extends StatelessWidget {
  const GroupItem(this.groupData);
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
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Text(groupData['name'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))
                                      )
                                    ),
                                    SizedBox(width: 5),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        child: Text(groupData['date'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14))
                                      )
                                    ),
                                  ],
                            ),
                            SizedBox(height: 3,),
                            new Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: Text(groupData['last_user'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
                                      )
                                    ),
                                  ],
                            ),
                            SizedBox(height: 3,),
                            new Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: Text(groupData['last_text'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14))
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