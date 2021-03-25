import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String imgUrl;

  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.imgUrl
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      imgUrl: json['imgUrl']
    );
  }

  Map<String, dynamic> toJSON(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'imgUrl': imgUrl
    };
  }
}