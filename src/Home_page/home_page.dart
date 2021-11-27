//import 'dart:html';

import 'package:flutter/material.dart';
import 'New_Announcement/new_announcment.dart';
import 'home_screen.dart';
import 'profile_page.dart';

class homePage extends StatefulWidget {
  createState() {
    return homepageState();
  }
}

class homepageState extends State<homePage> {
  int _selectedIndex = 0;

  // List<Widget> _widgetOptions = <Widget>[
  // HomePage(),
  // AnnouncementPage(),
  // profilePage(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AnnouncementPage()));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => profilePage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[50],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            (BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
              //activeIcon: HomePage(),
            )),
            (BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'notif',
              //activeIcon: AnnouncementPage(),
            )),
            (BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'you',
            )),
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Colors.purple.shade900,
          unselectedItemColor: Colors.grey.shade300,
          iconSize: 24.0,
          elevation: 8.0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: HomePage(),
      ),
    );
  }
}
