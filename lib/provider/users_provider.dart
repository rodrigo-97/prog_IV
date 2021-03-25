import 'package:flutter/foundation.dart';
import 'package:prog_IV/models/user.dart';
import 'package:prog_IV/services/fire_store.dart';
import 'package:uuid/uuid.dart';

class UsersProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  User _user;
  var uuid = Uuid();

  // getters
  User get user => _user;

  Stream<List<User>> get users => firestoreService.getUsers();

  saveUser(User user) {
    if (user.id == null) {
      var newUser = User(
        id: uuid.v1(),
        name: user.name,
        email: user.email,
        imgUrl: user.imgUrl,
      );
      firestoreService.setUser(newUser);
    } else {
      var newUser = User(
        id: user.id,
        name: user.name,
        email: user.email,
        imgUrl: user.imgUrl,
      );
      firestoreService.setUser(newUser);
    }
  }

  removeUser (String id) {
    firestoreService.removeUser(id);
  }
}
