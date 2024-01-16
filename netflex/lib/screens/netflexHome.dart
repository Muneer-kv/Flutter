import 'package:flutter/material.dart';
import 'package:netflex/screens/netflexDownload.dart';
import 'package:netflex/screens/netflexGame.dart';
import 'package:netflex/screens/netflexNew.dart';

class netflexHome extends StatefulWidget {
  @override
  State<netflexHome> createState() => _netflexHomeState();
}

class _netflexHomeState extends State<netflexHome> {
  final List categories = [
    "Adventure",
    "Anime",
    "Children",
    "Family",
    "Classic",
    "Comedies",
    "Documentaries",
    'Dramas',
    "Horror",
  ];

  Widget Itemcontainer(img) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Image.asset(img),
      ),
    );
  }

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/netflex.png',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/0.jpg'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Tv series'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Movies'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: categories
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {},
                        isExpanded: false,
                        value: categories.first,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 500,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Image.asset('assets/images/pre.jpeg'),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('mind-bending'),
                              Text('dyslotion'),
                              Text('cyberpunk'),
                              Text('US'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 100,
                                child: FloatingActionButton(
                                  onPressed: null,
                                  tooltip: 'Play',
                                  child: Icon(Icons.play_arrow),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 100,
                                child: FloatingActionButton(
                                    onPressed: null,
                                    tooltip: 'Add to list',
                                    child: Icon(Icons.add)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
              child: Text('watching'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Itemcontainer('assets/images/dun.jpeg'),
                  Itemcontainer('assets/images/et.jpg'),
                  Itemcontainer('assets/images/pre.jpeg'),
                  Itemcontainer('assets/images/et.jpg'),
                  Itemcontainer('assets/images/dun.jpeg'),
                ],
              ),
            )
          ],
        ),
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
