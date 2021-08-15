import 'package:chat_app/pages/user_page.dart';
import 'package:chat_app/pages/group_page.dart';
import 'package:chat_app/pages/group_list_page.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/root.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootApp(),
      onGenerateRoute: (settings) {
        final arguments = settings.arguments;
        switch (settings.name) {
          case '/user':
              return MaterialPageRoute(builder: (context) => UserPage(arguments));
          case '/group':
              return MaterialPageRoute(builder: (context) => GroupListPage());
          case '/group_detail':
              return MaterialPageRoute(builder: (context) => GroupPage(arguments));
          default:
            return MaterialPageRoute(builder: (context) => HomePage());
        }
      },
    );
  }
}
