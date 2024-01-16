import 'package:flutter/material.dart';
import 'package:netflex/screens/firstScreen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: firstScreen(),
      title: 'netflix clone',
    );
  }
}
