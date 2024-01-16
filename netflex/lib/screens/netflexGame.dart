import 'package:flutter/material.dart';
import 'package:netflex/screens/netflexDownload.dart';
import 'package:netflex/screens/netflexHome.dart';
import 'package:netflex/screens/netflexNew.dart';

class netflexGame extends StatefulWidget {
  const netflexGame({super.key});

  @override
  State<netflexGame> createState() => _netflexGameState();
}

class _netflexGameState extends State<netflexGame> {
  int myIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
      ),
      body: Center(
        child: Text('game'),
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
                      MaterialPageRoute(builder: (context) => const netflexGame()));
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
