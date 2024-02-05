import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetodo/firestore.dart';
import 'package:flutter/material.dart';

class todo extends StatefulWidget {
  const todo({super.key});

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  TextEditingController controller = TextEditingController();
  Firestoreservices fss = Firestoreservices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          openbox();
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fss.readnote(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notelist = snapshot.data!.docs;
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: notelist.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = notelist[index];
                String docid = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];
                return ListTile(
                  title: Text(noteText),
                  onTap: () {
                    openbox(docid: docid);
                  },
                  trailing: IconButton(
                    onPressed: (){
                      setState(() {
                        fss.deletenote(docid);
                      });
                    },
                    icon: Icon(Icons.delete)
                  ),
                );
              },
            );
          } else {
            return const Text('no notes');
          }
        },
      ),
    );
  }

  void openbox({String? docid}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Memo'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Type here'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {});
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (docid == null) {
                    fss.addnote(controller.text);
                  } else {
                    fss.updatenote(docid, controller.text);
                  }
                });
                controller.clear();
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
