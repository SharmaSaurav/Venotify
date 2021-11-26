import 'package:flutter/material.dart';
import './Home_page/home_page.dart';
import './login_signup/login.dart';
import './Home_page/New_Announcement/new_announcment.dart';

// class App extends StatelessWidget {
//   Widget build(context) {
//     return MaterialApp(
//       title: 'login!!',
//       home: Scaffold(
//         body: LoginPage(),
//         backgroundColor: Colors.deepPurple.shade100,
//       ),
//     );
//   }
// }
// ashya login page
import 'package:flutter/material.dart';
import 'screens/login_stateful.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: ('VENOTIFY'),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        cursorColor: Colors.indigo[600],
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          title: Text('WELCOME TO VENOTIFY!!'),
          shadowColor: Colors.indigo[600],
          backgroundColor: Colors.indigo[600],
        ),
        body: HomePage(),
      ),
    );
  }
}
