import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List todoList = [];
  final TextEditingController txtCtrl = TextEditingController();
  bool? isChecked = false;

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
                contentPadding: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),

                tileColor: Color.fromARGB(225, 59, 209, 126),

                // leading: Icon(Icons.check_box),
                title: Text(
                  todoList[index],
                ),

                onTap: () {
                  setState(() {
                    ;
                  });
                },
                trailing: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        todoList.removeAt(index);
                      },
                    );
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
                        var text;
                        text = txtCtrl.text;

                        setState(() {
                          todoList.add(text);
                          txtCtrl.clear();
                        });
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
