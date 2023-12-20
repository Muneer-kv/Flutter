import 'package:flutter/material.dart';
import 'package:login_1/widget/login.dart';

class MySignin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50),
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
                    Text(
                      'Create your Account ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'and Join us!',
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
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: 60, right: 60, top: 60),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'First Name'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60, right: 60),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60, right: 60),
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
              ]),
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
            height: 140,
          ),
          Container(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyLogin()),
                  );
                },
                child: Text('Already have an account')),
          ),
        ]),
      ),
    );
  }
}
