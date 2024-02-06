import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final CollectionReference contact =
      FirebaseFirestore.instance.collection('name');

  Future<Future<DocumentReference<Object?>>> addContact(
      String name, String number) async {
    if (name.isNotEmpty && number.isNotEmpty) {
      return contact.add({
        'name': name,
        'number': number,
      });
    } else {
      // ignore: null_argument_to_non_null_type
      return Future.value(null);
    }
  }

  Stream<QuerySnapshot> getContact() {
    final contactstream =
        contact.orderBy('name', descending: false).snapshots();
    return contactstream;
  }

  Future<void> updateContact(
      String docid, String newname, String newnumber) async {
    return contact.doc(docid).update({'name': newname, 'number': newnumber});
  }


  Future <void> deletecontact(String docid)async{
    return contact.doc(docid).delete();
  }
}
