import 'dart:convert';
import 'package:chat_app/json/data.dart';
import 'package:chat_app/theme/colors.dart';
import 'package:chat_app/util/constant.dart';
import 'package:chat_app/widgets/explore_group_item.dart';
import 'package:chat_app/widgets/group_box.dart';
import 'package:chat_app/widgets/group_item.dart';
import 'package:chat_app/widgets/my_divider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroupListPage extends StatefulWidget {
  const GroupListPage();

  @override
  _GroupListPageState createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {

  List groupsData = [];
  @override
  void initState() {
    super.initState();
    fetchGroups();
    groupsData = groups;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            title:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Groups", style: TextStyle(fontSize: 28, color: black, fontWeight: FontWeight.bold),),
                  Icon(Icons.add, color: primary, size: 28,)
                ],
              ),
            backgroundColor: white,
            bottom: const TabBar(
              indicatorColor: primary,
              labelPadding: EdgeInsets.only(bottom: 15),
              tabs: [
                Text( "Your Groups", style: TextStyle(fontSize: 16, color: black, fontWeight: FontWeight.w500),),
                Text( "Explore Groups", style: TextStyle(fontSize: 16, color: black, fontWeight: FontWeight.w500),)
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: getSearchBox(),
                  ),
                  getYourGroups(),
                ]
              ),
              ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: getSearchBox(),
                  ),
                  getSuggestedGroups(),
                  MyDivider(color: grey, thickness: 0.5,),
                  getExploreGroups(),
                ]
              ),
            ],
          ),
        ),
    );
  }

  Widget getSearchBox(){
    return
      Container(
                height: 38,
                decoration: BoxDecoration(
                    color: grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: TextStyle(color: white),
                  cursorColor: primary,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: white.withOpacity(0.8)),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: white.withOpacity(0.8), fontSize: 17)),
                ),
              );
  }

  Widget getExploreGroups(){
    return
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
            children: List.generate(groupsData.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/group_detail", arguments: {"group": groupsData[index]});
              },
              child: ExploreGroupItem(groupsData[index])
            );
          })
        ),
      );
  }

  Widget getYourGroups(){
    return
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
            children: List.generate(groupsData.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/group_detail", arguments: {"group": groupsData[index]});
              },
              child: GroupItem(groupsData[index])
            );
          })
        ),
      );
  }

  Widget getSuggestedGroups(){
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Text( "Suggested Groups", style: TextStyle(fontSize: 17, color: black, fontWeight: FontWeight.w600),),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(groups.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 15, top: 15, right: (index == groups.length -1) ? 15 : 0),
                    child: GroupBox(groups[index])
                  );
                }),
              ),
          ),
        ],
      );
  }

  bool isLoadingGroups = false;
  Future fetchGroups() async {
    print("fetchGroups");
    if(isLoadingGroups) return;
    setState(() {
      isLoadingGroups = true;
    });
    var url = Uri.parse(API_URL + 'groups');
    try {
      final response = await http.get(url, 
              headers: {
                "Accept": "application/json"
              }
            );
      var data = jsonDecode(response.body);
      print(data);
    } on Exception catch (e) {
      print(e);
    }
    setState(() {
      isLoadingGroups = false;
    });
  }
}

