import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_1/firebase/authservice.dart';
import 'package:login_1/widget/Signup.dart';
import 'package:login_1/widget/forgotpassword.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  MyLoginHome createState() => MyLoginHome();
}

class MyLoginHome extends State<MyLogin> {
  final firebaseAuthServices firbaseservice = firebaseAuthServices();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WELCOME',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow.shade800),
                      ),
                      Text(
                        'BACK.',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow.shade800),
                      ),
                      const Text(
                        'Please Login to ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Your Account',
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
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, top: 60),
                    child: TextField(
                      controller: emailcontroller,
                      decoration: const InputDecoration(labelText: 'E-mail'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: TextField(
                      controller: passwordcontroller,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                        ),
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      const Text('Remember me'),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 70,
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const forgotPassword()));
                            },
                            child: const Text('Forgot password')),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 120,
              height: 50,
              child: FloatingActionButton(
                onPressed: () {
                  signin();
                },
                backgroundColor: Colors.yellow.shade800,
                foregroundColor: Colors.white,
                child: const Text('Sign In'),
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MySignin()),
                  );
                },
                child: const Text('Dont have an Account')),
          ],
        ),
      ),
    );
  }

  void signin() async {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;

    User? user =
        await firbaseservice.signinwithemailandpassword(email, password);

    if (user != null) {
      print('user is successfully signin');
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
