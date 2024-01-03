import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todolist = [];
  TextEditingController controller = TextEditingController();
  List<bool> isChecked = [];

  void addtolist() {
    setState(() {
      if (controller.text.isNotEmpty) {
        todolist.add(controller.text);
        isChecked.add(false);
      }
    });
  }

  void itemdelete(int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  void itemcheck(int index) {
    setState(() {
      isChecked[index] = !isChecked[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: todolist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: Checkbox(
                    value: isChecked[index],
                    onChanged: (bool? value) {
                      setState(() {
                        itemcheck(index);
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      itemcheck(index);
                    });
                  },
                  title: Text(todolist[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        itemdelete(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          addtolist();
                          controller.clear();
                        });
                      },
                      child: const Icon(Icons.add),
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
