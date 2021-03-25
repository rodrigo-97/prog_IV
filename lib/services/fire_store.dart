import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prog_IV/models/user.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //get
  Stream<List<User>> getUsers(){
    return _db
      .collection('users')
      .snapshots()
      .map((snapshot) => snapshot.docs
      .map((doc) => User.fromJson(doc.data()))
      .toList());
  }

  //upsert
  Future<void> setUser(User user){
    var options = SetOptions(merge: true);
    return _db
      .collection('users')
      .doc(user.id)
      .set(user.toJSON(), options);
  }

  //delete
  Future<void> removeUser(String id){
    return _db
      .collection('users')
      .doc(id)
      .delete();
  }
}