// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_1/firebase/authservice.dart';
import 'package:login_1/widget/login.dart';

class MySignin extends StatefulWidget {
  const MySignin({super.key});

  @override
  State<MySignin> createState() => _MySigninState();
}

class _MySigninState extends State<MySignin> {
  final firebaseAuthServices firbaseservice = firebaseAuthServices();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    usernamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'JOIN US',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow.shade800),
                    ),
                    Text(
                      'NOW!',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow.shade800),
                    ),
                    const Text(
                      'Create your Account ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'and Join us!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 60, right: 60, top: 60),
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 60, right: 60),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 60, right: 60),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 120,
            height: 50,
            child: FloatingActionButton(
              onPressed: () {
                signup();
              },
              backgroundColor: Colors.yellow.shade800,
              foregroundColor: Colors.white,
              child: const Text('Sign Up'),
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyLogin()),
                );
              },
              child: const Text('Already have an account')),
        ]),
      ),
    );
  }

  void signup() async {
    String username = usernamecontroller.text;
    String email = emailcontroller.text;
    String password = passwordcontroller.text;

    User? user =
        await firbaseservice.signupwithemailandpassword(email, password);

    if (user != null) {
      print('user is successfully created');
      // Navigator.pushNamed(context, "/home");
      Navigator.pushNamed(context, 'home');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
          );
        },
      );
    }
  }
}
