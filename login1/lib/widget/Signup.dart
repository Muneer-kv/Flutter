import 'package:flutter/material.dart';

class MyHome1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'E-mail', border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Confirm E-mail',
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Password', border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  child: FloatingActionButton(
                    onPressed: null,
                    child: Text('Sign in'),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 150,
                ),
                Container(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Already have an account'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
