import 'package:chat_app/pages/group_list_page.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({ Key? key }) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getBottomBar(),
      floatingActionButton: getHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: getBarPage()
    );
  }

  Widget getHomeButton(){
    return Container(
        margin: EdgeInsets.only(top:45),
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        color: activeTab == 2 ? primary : grey, shape: BoxShape.circle
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(1),
                        child: IconButton(onPressed: (){
                          setState(() {
                            activeTab = 2;
                          });
                        }, icon: Icon(Icons.layers_outlined, color: white, size: 38,)
                      )
                    ),
            );
  }

  Widget getBarPage(){
    return 
      IndexedStack(
        index: activeTab,
        children: <Widget>[
          Center(
            child: Text("Peers",style: TextStyle(
              fontSize: 35
            ),),
          ),
          GroupListPage(),
          HomePage(),
          Center(
            child: Text("Chats",style: TextStyle(
              fontSize: 35
            ),),
          ),
           Center(
            child: Text("Profile",style: TextStyle(
              fontSize: 35
            ),),
          )
        ],
      );
  }

Widget getBottomBar() {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)), color: white,
        boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 0;
                  });
                },
                child: BottomBarItem(Icons.people_alt_outlined, "Peers", isActive: activeTab == 0, activeColor: primary),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 1;
                  });
                },
                child: BottomBarItem(Icons.groups_outlined, "Groups", isActive: activeTab == 1, activeColor: primary),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 2;
                  });
                },
                child: BottomBarItem(Icons.do_not_touch, "Home", isActive: activeTab == 2, activeColor: primary),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 3;
                  });
                },
                child: BottomBarItem(Icons.chat_bubble_outline_outlined, "Chats", isActive: activeTab == 3, activeColor: primary, isNotified: true,),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 4;
                  });
                },
                child: BottomBarItem(Icons.settings_outlined, "Profile", isActive: activeTab == 4, activeColor: primary),
              ),
              ]
            )
        ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(this.icon, this.title, {this.color = grey, this.activeColor = primary, this.isActive = false, this.isNotified = false});
  final IconData icon;
  final String title;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              isNotified ?
              new Stack(
                children: <Widget>[
                  new Icon(icon, size: 26, color: isActive ? activeColor : color,),
                  new Positioned( 
                    top: 5.0,
                    right: 0,
                    left: 8.0,
                    child: 
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: new Icon(Icons.brightness_1, size: 10.0, color: notifyColor),
                      ),
                  )
                ]
              ) 
              :
              new Icon(icon, size: 26, color: isActive ? activeColor : color,),
              Text(title, style: TextStyle(fontSize: 10, color: isActive ? activeColor : color)),
            ],
          );  
  }
}