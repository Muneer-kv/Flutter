import 'package:cloud_firestore/cloud_firestore.dart';

class Firestoreservices {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future<Future<DocumentReference<Object?>>> addnote(String note) async {
    return notes.add({'note': note, 'time': Timestamp.now()});
  }

  Stream<QuerySnapshot> readnote() {
    final note = notes.orderBy('time', descending: true).snapshots();

    return note;
  }

  Future<void> updatenote(String docid, String newnote) async {
    return notes.doc(docid).update({
      'note': newnote,
      'time': Timestamp.now(),
    });
  }

  Future <void> deletenote(String docid){
    return notes.doc(docid).delete();
  }
}
