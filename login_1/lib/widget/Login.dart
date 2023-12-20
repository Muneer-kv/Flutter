import 'package:flutter/material.dart';
import 'package:login_1/widget/Signup.dart';

class MyLogin extends StatefulWidget {
  @override
  MyLoginHome createState() => MyLoginHome();
}

class MyLoginHome extends State<MyLogin> {
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
                  padding: EdgeInsets.only(left: 50),
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
                      Text(
                        'Please Login to ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your Account',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 60, right: 60, top: 60),
                      child: TextField(
                        decoration: InputDecoration(labelText: 'E-mail'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 60, right: 60),
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Password'),
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
                        Text('Remember me'),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 70,
                          ),
                          child: TextButton(
                              onPressed: null, child: Text('Forgot password')),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 120,
              height: 50,
              child: FloatingActionButton(
                onPressed: null,
                child: Text('Sign In'),
                backgroundColor: Colors.yellow.shade800,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 180,
            ),
            Container(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MySignin()),
                    );
                  },
                  child: Text('Dont have an Account')),
            ),
          ],
        ),
      ),
    );
  }
}
