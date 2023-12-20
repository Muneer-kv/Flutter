import 'package:flutter/material.dart';
import 'package:login1/widget/Login.dart';
import './widget/Login.dart';
import './widget/Signup.dart';
//import './widget/test.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
