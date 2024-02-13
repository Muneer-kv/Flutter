import 'package:flutter/material.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
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
                        'RESET',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow.shade800),
                      ),
                      Text(
                        'PASSWORD.',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow.shade800),
                      ),
                      // const Text(
                      //   'Please Login to ',
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                      // ),
                      // const Text(
                      //   'Your Account',
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
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
                      decoration: InputDecoration(labelText: 'New Password'),
                    ),
                  ),
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
                onPressed: () {},
                backgroundColor: Colors.yellow.shade800,
                foregroundColor: Colors.white,
                child: const Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
