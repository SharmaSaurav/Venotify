import 'package:flutter/material.dart';
import './login_signup/login.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'login!!',
      home: Scaffold(
        body: LoginPage(),
        backgroundColor: Colors.deepPurple.shade100,
      ),
    );
  }
}
