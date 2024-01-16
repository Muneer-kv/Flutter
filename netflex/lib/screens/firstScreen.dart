import 'package:flutter/material.dart';
import 'package:netflex/screens/netflexHome.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({super.key});

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "NETFLEX",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text('Who is watching?'),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(50),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                ListTile(
                  // tileColor: Colors.red,
                  title: Image.asset('assets/images/0.jpg'),
                  subtitle: const Text(
                    'muneer',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                  setState(() {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => netflexHome()));
                  });
                  },
                ),
                Container(
                  height: 20,
                  width: 20,
                  color: Colors.blueGrey,
                ),
                Container(
                  height: 20,
                  width: 20,
                  color: Colors.green,
                ),
                Container(
                  height: 20,
                  width: 20,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
