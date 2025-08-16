import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phn_auth/main.dart';
import 'package:firebase_phn_auth/screens/phone_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => wrapperState();
}

class wrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHomePage(title: "welcome");
          } else {
            return PhoneAuth();
          }
        },
      ),
    );
  }
}
