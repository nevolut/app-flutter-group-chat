
import 'package:chat_app/theme/colors.dart';
import 'package:chat_app/util/global.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_divider.dart';
import 'package:chat_app/widgets/user_avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserPage extends StatefulWidget {
  final arguments; 
  UserPage(this.arguments);
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var userData;

  @override
  void initState() {
    super.initState();
    print("UserPage");
    userData = widget.arguments["user"];
    // userData = users[0];
    print(userData);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: getBody(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: getNavigationButtons()
      );
  }

  Widget getNavigationButtons(){
    return 
      Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: 
                                  MyButton(
                                    onTap: (){}, 
                                    title: "Decline",
                                    bgColor: lightRed,
                                    icon: Icons.close,
                                  )
                                ),
                                SizedBox(width: 7,),
                                Expanded(child: 
                                  MyButton(
                                    onTap: (){}, 
                                    title: "Match",
                                    icon: Icons.check,
                                  )
                                ),
                              ],
                            )
        );
  }

  Widget getBody() {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  color: accountBgColor,
              ),
              Container(
                      child: AppBar(
                        title: Text(''),// You can add title here
                        leading: new IconButton(
                          icon: new Icon(Icons.keyboard_backspace_outlined, color: black),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        actions: [
                          new IconButton(
                            icon: new Icon(Icons.error_outline_outlined, color: black),
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        ],
                        backgroundColor: Colors.transparent, //You can make this transparent
                        elevation: 0.0, //No shadow
                      ),
              ),
              Positioned(
                top: 150,
                child: 
                Container(
                  alignment: AlignmentDirectional.topStart,
                  padding:EdgeInsets.only(top: 25, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                  ),
                  child: Row( 
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children : [
                            Icon(Icons.undo_outlined, color: grey,),
                            Icon(Icons.redo_outlined, color: primary,)
                          ]
                        ),
                ),
              ),
              Positioned(
                top: 120,
                child:
                  Column(
                    children: [
                      UserAvatarImage(userData['anonName'], borderWidth: 5,),
                      // Container(
                      //               width: 100,
                      //               height: 100,
                      //               decoration: BoxDecoration(
                      //                 border: Border.all(color: white, width: 5),
                      //                 color: white,
                      //                 shape: BoxShape.circle,
                      //                 image: DecorationImage(
                      //                       image: getDisplayImage(userData['image'], type: 1),
                      //                       fit: BoxFit.cover)),
                      //             ),
                      SizedBox(height: 10,),      
                      Text(userData['anonName'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,)),
                      SizedBox(height: 10,),
                      Text("They/Them", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: grey)),
                      SizedBox(height: 20,),
                    ],
                  )
              ),
            ],
          ),
          Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width,
                color: bgColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: accountBgColor.withOpacity(.35),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children :[
                            SizedBox(height: 5,),
                            new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: new Padding(
                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                        Icon(Icons.timeline_outlined, color: primary),
                                                        SizedBox(width: 5),
                                                        Expanded(child: Text(getArrayString(userData["topics"]), maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14)),)
                                                      ]
                                                ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: new Padding(
                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                        Icon(Icons.psychology_outlined, color: primary),
                                                        SizedBox(width: 5),
                                                        Expanded(child: Text(getArrayString(userData["solutions"]), maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14)),)
                                                      ]
                                                ),
                                  ),
                                ),
                              ],
                            ),
                            MyDivider(color: white),
                            new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: new Padding(
                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                        Icon(Icons.face_outlined, color: primary),
                                                        SizedBox(width: 5),
                                                        Expanded(child: Text(userData["race"], maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14)),)
                                            ]
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: new Padding(
                                    padding:  const EdgeInsets.only(left: 5, right: 5,),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                        Icon(Icons.favorite_border_outlined, color: primary),
                                                        SizedBox(width: 5),
                                                        Expanded(child: Text(userData["sexPref"] + '\n', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14)),)
                                                      ]
                                                ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                          ]
                        ),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.push_pin_outlined, color: primary),
                          SizedBox(width: 5,),
                          Text("My Story", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))
                        ]
                      ),
                      SizedBox(height: 5,),
                      // Text(userData['story'],
                      //     maxLines: 3,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: TextStyle(fontSize: 14, height: 1.4)
                      // ),
                      ReadMoreText(userData['story'],
                        trimLines: 3,
                        style: TextStyle(color: black, fontSize: 14, height: 1.3),
                        colorClickableText: primary,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'More',
                        trimExpandedText: 'Less',
                        moreStyle: TextStyle(fontSize: 14, color: primary),
                      ),
                      MyDivider(color: grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.music_note_outlined, color: primary,),
                          SizedBox(width: 5,),
                          Expanded(child: Text("My favorite feel-good song...", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14)))
                        ]
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: RichText(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              text: new TextSpan(
                                                style: new TextStyle(
                                                  fontSize: 14.0,
                                                  color: black,
                                                  fontWeight: FontWeight.w500
                                                ),
                                                children: <TextSpan>[
                                                  new TextSpan(text: "Vampire Weekend", style: new TextStyle(fontWeight: FontWeight.bold)),
                                                  new TextSpan(text: " - " + "Horchata"),
                                                ],
                                              ),
                                            ),
                          ),
                          Text("5:32"),
                          Icon(Icons.play_arrow_rounded, color: primary, size: 34,),
                        ]
                      ),
                      SizedBox(height: 25,),
                      
                    ]
                  ),
                ) 
              )
        ],
      );
  }
  
}
