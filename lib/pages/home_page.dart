
import 'dart:convert';

import 'package:chat_app/json/data.dart';
import 'package:chat_app/theme/colors.dart';
import 'package:chat_app/util/constant.dart';
import 'package:chat_app/util/global.dart';
import 'package:chat_app/widgets/user_avatar_image.dart';
import 'package:chat_app/widgets/user_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      usersData = usersTest;
    });
    fetchUsers();
  }

  Widget getBody() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: getDisplayImage("https://i.dlpng.com/static/png/6795525_preview.png"), width: 35, height: 35,),
              new Stack(
                children: <Widget>[
                  new IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined, color: grey, size: 28,)),
                  new Positioned(  // draw a red marble
                    top: 8.0,
                    right: 10.0,
                    child: new Icon(Icons.brightness_1, size: 8.0, color: notifyColor),
                  )
                ]
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Text("Welcome back, Frederik!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
          child:Text("Find relevant matches today and jump right into the most recent activity.", style: TextStyle(fontSize: 14, color: textColor),)
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("You have something in common with: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,)),
              Text("View all", style: TextStyle(color: primary, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(usersData.length, (index) {
              return Padding(
                padding: EdgeInsets.only(left: 15, bottom: 15, top: 15, right: (index == usersData.length - 1) ? 15 : 0),
                child: UserBox(user: usersData[index])
              );
            }),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
          child: Text("Activity in your community:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,)),
        ),
        SizedBox(height: 10,),
        Column(
          children: List.generate(usersTest.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/user", arguments: {"user": usersTest[index]});
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserAvatarImage(usersTest[index]['anonName'], width: 45, height: 45,),
                  // Container(
                  //   width: 45,
                  //   height: 45,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //           image: getDisplayImage(usersTest[index]['image']),
                  //           fit: BoxFit.cover)),
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded( child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: usersTest[index]['anonName']),
                              new TextSpan(text: " \"" + usersTest[index]['story'] + "\"", style: new TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                          SizedBox(height: 3,),
                          Text(
                            "2 hours ago",
                            style: TextStyle(fontSize: 13, color: grey),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }))
      ],
    );
  }

  List usersData = [];
  bool isLoadingUsers = false;
  Future fetchUsers() async {
    print("fetchUsers");
    if(isLoadingUsers) return;
    setState(() {
      isLoadingUsers = true;
    });
    var url = Uri.parse(API_URL + 'users');
    var data;
    try {
      final response = await http.get(url, 
              headers: {
                "Accept": "application/json"
              }
            );
      data = jsonDecode(response.body);
      print(data);
    } on Exception catch (e) {
      print(e);
    }
    
    setState(() {
      usersData = data;
      isLoadingUsers = false;
    });
  }

}
