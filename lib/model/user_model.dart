import 'package:flutter/material.dart';

class UserData {
  bool isValid;
  String? name;
  String? uid;
  String? email;

  UserData({required this.isValid, this.name, this.email, this.uid});
  Map<String, Object> toDoc() {
    return {'name': name ?? "", 'uid': uid ?? "", 'email': email ?? ""};
  }

  UserData fromDoc(Map<String, dynamic> doc) {
    return UserData(
        isValid: true, name: doc['name'], email: doc['email'], uid: doc[uid]);
  }
}
