import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  //get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // CREATE: add new notes
  Future<void> addNote(String note) {
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }

  // READ: get notes from database
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();

    return notesStream;
  }

  // UPDATE: update notes given a doc id
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE: delete notes given a doc id
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }

  // void addData() {
  //   notes.add({
  //     'name': 'New Item',
  //     'timestamp': FieldValue.serverTimestamp(),
  //   }).then((value) {
  //     print('Document Added with ID: ${value.id}');
  //   }).catchError((error) {
  //     print('Error adding document: $error');
  //   });
  // }

  // void updateData(String oldText, String newData) {
  //   notes.where('name', isEqualTo: oldText).get().then((querySnapshot) {
  //     if (querySnapshot.docs.isNotEmpty) {
  //       var documentId = querySnapshot.docs.first.id;
  //       notes.doc(documentId).update({
  //         'name': newData,
  //         'timestamp': FieldValue.serverTimestamp(),
  //       }).then((value) {
  //         print('Document Updated');
  //       }).catchError((error) {
  //         print('Error updating document: $error');
  //       });
  //     }
  //   });
  // }

  // void deleteData(String documentId) {
  //   notes.doc(documentId).delete().then((value) {
  //     print('Document Deleted');
  //   }).catchError((error) {
  //     print('Error deleting document: $error');
  //   });
  // }
}
