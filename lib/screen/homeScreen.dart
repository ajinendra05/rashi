import 'package:flutter/material.dart';
import 'package:rashient/screen/login.dart';
import 'package:rashient/server/Data/Auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber,
            title: const Text('Home'),
            actions: [
              IconButton(
                  onPressed: () {
                    Auth().signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  icon: Icon(Icons.logout))
            ]),
        body: Center(child: Text('email : ${Auth().getCurrentUser()!.email}')));
  }
}
