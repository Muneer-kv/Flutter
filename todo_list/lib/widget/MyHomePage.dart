import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> todoList = [];
  TextEditingController txtCtrl = TextEditingController();

  void addItem() {
    setState(
      () {
        todoList.add({'text': txtCtrl.text, 'isDrawn': false});
        txtCtrl.clear();
      },
    );
  }

  void deleteItem(int index) {
    setState(
      () {
        todoList.removeAt(index);
      },
    );
  }

  void toggleDrawn(int index) {
    setState(() {
      todoList[index]['isDrawn'] = !todoList[index]['isDrawn'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 162, 71),
        title: Text("Todo List"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Color.fromARGB(225, 59, 209, 126),
                title: Text(
                  todoList[index]['text'],
                  style: TextStyle(
                    decoration: todoList[index]['isDrawn']
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                onTap: () => toggleDrawn(index),
                trailing: IconButton(
                  onPressed: () {
                    deleteItem(index);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color.fromARGB(168, 230, 225, 225),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: txtCtrl,
                        decoration: InputDecoration(
                          label: Text('Type here'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        addItem();
                      },
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
