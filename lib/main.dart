import 'package:flutter/material.dart';
import 'package:product_app/views/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //..
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}