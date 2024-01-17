import 'package:calc/calculator.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      home: calculator(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}