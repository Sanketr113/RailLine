import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:railline/Pages/LoginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        this.context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GeeksForGeeks")),
      body: Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          signOut();
        }),
        child: Icon(Icons.logout_rounded),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
