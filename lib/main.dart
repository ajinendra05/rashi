import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'screen/login.dart';
import 'screen/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp Fapp = await Firebase.initializeApp();
  runApp(OverlaySupport(
      child: GetMaterialApp(
    home: MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rashi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
