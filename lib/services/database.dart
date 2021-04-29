import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_relief/models/fast.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference fastUserCollection = FirebaseFirestore.instance.collection(
      'FAST');

  Future updateUserData(String firstName, String lastName, String music,
      String hobbies) async {
    return await fastUserCollection.doc(uid).set({
      'First Name': firstName,
      'Last Name' : lastName,
      'hobbies' : hobbies,
      'music' : music,
    });
  }

  //FAST user list from snapshots
  List<Fast> _fastUserListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Fast(
          firstName: doc.data()['First Name'] ?? '',
          lastName: doc.data()['Last Name'] ?? '',
          hobbies: doc.data()['hobbies'] ?? '',
          music: doc.data()['music'] ?? ''
      );
    }).toList();
  }

  // get fast user list stream
  Stream<List<Fast>> get fast {
    return fastUserCollection.snapshots()
        .map(_fastUserListFromSnapshot);
  }
}