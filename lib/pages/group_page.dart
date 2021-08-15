
import 'package:chat_app/theme/colors.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_divider.dart';
import 'package:chat_app/widgets/my_circle_image.dart';
import 'package:chat_app/widgets/tag_view.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class GroupPage extends StatefulWidget {
  final arguments; 
  GroupPage(this.arguments);
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  var groupData;

  @override
  void initState() {
    super.initState();
    print("GroupPage");
    print(widget.arguments);
    groupData = widget.arguments["group"];

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: groupBgColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: getBody(),
        )
      );
  }

  Widget getBody(){
    return 
       Column(
              children:[
                Container(
                    child: AppBar(
                      leading: new IconButton(
                        icon: new Icon(Icons.keyboard_backspace_outlined, color: primary),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      backgroundColor: groupBgColor,
                      elevation: 0.0, 
                    ),
                ),
                Container(
                    color: groupBgColor,
                    padding: EdgeInsets.only(bottom: 0),
                                width: MediaQuery.of(context).size.width,
                                child: 
                                Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        MyCircleImage(groupData['image'], borderWidth: 5,),
                        SizedBox(height: 15,),
                        Text(groupData['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,)),
                        SizedBox(height: 10,),
                        Text("Anxiety", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: grey)),
                        SizedBox(height: 20,),
                      ])
                ),
                Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                    child: new Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children : [
                                          Icon(Icons.people_alt_outlined, color: primary),
                                          SizedBox(height: 5,),
                                          RichText(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            text: new TextSpan(
                                              style: new TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600
                                              ),
                                              children: <TextSpan>[
                                                new TextSpan(text: groupData["numMembers"].toString()),
                                                new TextSpan(text: " (" + groupData["numPending"].toString() + ")", style: new TextStyle(color: primary)),
                                              ],
                                            ),
                                          ),
                                        ]
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    child: new Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children : [
                                          Icon(Icons.lock_open_outlined, color: primary),
                                          SizedBox(height: 5,),
                                          Text(groupData["privacyType"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
                                        ]
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    child: new Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children : [
                                          Icon(Icons.mail_outlined, color: primary),
                                          SizedBox(height: 5,),
                                          Text(groupData["joinType"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
                                        ]
                                      )
                                    ),
                                  ),
                                ],
                        ),
                        MyDivider(color: grey.withOpacity(0.5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.push_pin_outlined, color: primary),
                            SizedBox(width: 5,),
                            Text("Group Description", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))
                          ]
                        ),
                        ReadMoreText(groupData['description'],
                          trimLines: 3,
                          style: TextStyle(color: black, fontSize: 14, height: 1.3),
                          colorClickableText: primary,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'More',
                          trimExpandedText: 'Less',
                          moreStyle: TextStyle(fontSize: 14, color: primary),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.tag_outlined, color: primary),
                            SizedBox(width: 5,),
                            Text("Tags", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700))
                          ]
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child:
                            FlutterTagView(tags: groupData['tags'], tagBackgroundColor: lightPurple),
                        ),
                        SizedBox(height: 15,),  
                        GroupButton(prefixIcon: Icons.lock_outline, title: "Community Forum",),
                        SizedBox(height: 10,), 
                        GroupButton(prefixIcon: Icons.lock_outline, title: "Community Chat",),
                        SizedBox(height: 10,),
                        GroupButton(prefixIcon: Icons.lock_outline, title: "Manage Membership",),
                        SizedBox(height: 15),
                        MyButton(title: "Request to Join",
                          onTap: (){
                            print("Request to Join");
                          }
                        ),
                        SizedBox(height: 15),
                      ]
                    ),
                )
              ]
            )
    ;
  }
}

class GroupButton extends StatelessWidget {
  const GroupButton({ Key? key, this.title = "", required this.prefixIcon, this.bgColor = groupBgColor, this.iconColor = grey}) : super(key: key);
  final String title;
  final IconData prefixIcon;
  final Color iconColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: bgColor
                          ),
                          child:
                          new Row(
                                children: <Widget>[
                                  Expanded(
                                    flex:1,
                                    child: Icon(prefixIcon, color: iconColor)
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, 
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: grey)
                                    )
                                  ),
                                  Expanded(
                                    flex:1,
                                    child: Icon(Icons.navigate_next_outlined, color: iconColor),
                                  ),
                                ],
                              ),
                        );
  }
}