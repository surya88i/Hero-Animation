import 'package:drawer/HomePage.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DashboardPage(),
        title: "Sports",
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
      );
  }
}
