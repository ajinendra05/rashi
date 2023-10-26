import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

DocumentReference<Map<String, dynamic>>? userDocReference;
// DocumentReference<Map<String, dynamic>>? secondaryUserDocReference;
Color red = Colors.red;
Color green = Colors.green;

abstract class BaseAuth {
  Future<User> signIn({required String email, required String password});
  Future<User> signUP({required String email, required String password});
  User? getCurrentUser();

  Future<void> signOut();

  Future<void> changePassword({required String email});
  Stream<User?> getAuthState();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user;

  @override
  Stream<User?> getAuthState() {
    return _firebaseAuth.authStateChanges().map((event) => event);
  }

  @override
  Future<void> changePassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      showSimpleNotification(
          const Text(
              'We have sent you email to recover password, please check email.'),
          background: green);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSimpleNotification(const Text('No user found for that email.'),
            background: red);
        print('No user found for that email.');
      } else {
        showSimpleNotification(const Text('Something went wrong'),
            background: red);
      }
    }
  }

  @override
  User? getCurrentUser() {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      userDocReference =
          FirebaseFirestore.instance.collection("users").doc(user.uid);
    }
    return user;
  }

  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSimpleNotification(const Text('No user found for that email.'),
            background: red);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSimpleNotification(const Text('Wrong password provided.'),
            background: red);
        print('Wrong password provided.');
      } else {
        showSimpleNotification(const Text('Something went wrong'),
            background: red);
      }
    }

    return user!;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
