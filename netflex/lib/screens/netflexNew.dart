import 'package:flutter/material.dart';
import 'package:netflex/screens/netflexDownload.dart';
import 'package:netflex/screens/netflexGame.dart';
import 'package:netflex/screens/netflexHome.dart';

class netflexNew extends StatefulWidget {
  const netflexNew({super.key});

  @override
  State<netflexNew> createState() => _netflexNewState();
}

class _netflexNewState extends State<netflexNew> {
  int myIndex=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New items'),
      ),
      body: Center(
        child: Text('new'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color.fromARGB(255, 255, 247, 247),
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => netflexHome()));
              },
              icon: const Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
              label: 'Game',
              icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => netflexGame()));
                },
                icon: const Icon(Icons.gamepad),
              )),
          BottomNavigationBarItem(
            label: 'New',
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => netflexNew()));
              },
              icon: const Icon(Icons.new_releases_outlined),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Downlaod',
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => netflexDownload()));
              },
              icon: const Icon(Icons.new_releases_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
