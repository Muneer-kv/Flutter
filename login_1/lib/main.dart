import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_1/firebase/firebase_options.dart';
import 'package:login_1/widget/Login.dart';
import 'package:login_1/widget/Signup.dart';
import 'package:login_1/widget/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // home: const MyLogin(),
      initialRoute: "/",
      routes: {
        '/':(context)=>MyLogin(),
        'signin':(context)=>MySignin(),
        'home':(context)=>home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
