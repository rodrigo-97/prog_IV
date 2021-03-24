import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prog_IV/service/dammy.dart';
import 'package:prog_IV/models/user.dart';

class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_DATA};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          email: user.email,
          imgUrl: user.imgUrl,
          name: user.name,
        ),
      );
    }

    notifyListeners();
  }

  void remove (User user){
    if (user != null && user.id != null){
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
