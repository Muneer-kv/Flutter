import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts/firebase/firestore.dart';
import 'package:flutter/material.dart';

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController newname = TextEditingController();
  TextEditingController newnumber = TextEditingController();
  FirestoreServices firestoreservices = FirestoreServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            bottomsheet();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreservices.getContact(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List contactlist = snapshot.data!.docs;
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: contactlist.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = contactlist[index];
                String docid = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String showcontactname = data['name'];
                String showcontatnumber = data['number'];
                return ListTile(
                  title: Text(
                    showcontactname,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text(showcontatnumber),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          contactedit(docid);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          firestoreservices.deletecontact(docid);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text('nothing to return');
          }
        },
      ),
    );
  }

  Future bottomsheet() async {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Add contact',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                    hintText: 'Enter Name', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phonecontroller,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                    hintText: 'Enter Number', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: const Text('cancel'),
                    ),
                  ),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          firestoreservices.addContact(
                            namecontroller.text,
                            phonecontroller.text,
                          );
                        });
                        Navigator.pop(context);
                        namecontroller.clear();
                        phonecontroller.clear();
                      },
                      child: const Text('Ok'),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> contactedit(String? docID) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 260),
            title: const Text('Edit Contact'),
            content: Column(
              children: [
                TextFormField(
                  controller: newname,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: newnumber,
                  decoration: const InputDecoration(
                    labelText: 'Number',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                          newname.clear();
                          newnumber.clear();
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: () {
                          if (newname.text.isNotEmpty ||
                              newnumber.text.isNotEmpty) {
                            firestoreservices.updateContact(
                                docID!, newname.text, newnumber.text);
                          }
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
