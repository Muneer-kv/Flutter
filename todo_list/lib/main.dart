import 'package:flutter/material.dart';
import 'package:todo_list/widget/MyHomePage.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo List',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
