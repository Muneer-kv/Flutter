import 'package:flutter/material.dart';
import 'package:netflex/screens/netflexGame.dart';
import 'package:netflex/screens/netflexHome.dart';
import 'package:netflex/screens/netflexNew.dart';

class netflexDownload extends StatefulWidget {
  const netflexDownload({super.key});

  @override
  State<netflexDownload> createState() => _netflexDownloadState();
}

class _netflexDownloadState extends State<netflexDownload> {
  int myIndex=3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download'),
      ),
      body: Center(
        child: Text('download'),
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
                    MaterialPageRoute(builder: (context) => const netflexDownload()));
              },
              icon: const Icon(Icons.new_releases_outlined),
            ),
          ),
        ],
      ),
    );
  }
}