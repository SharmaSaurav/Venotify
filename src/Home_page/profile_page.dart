import 'package:flutter/material.dart';
import 'new_announcement.dart';
import 'home_page.dart';


class profilePage extends StatefulWidget {
  createState() {
    return profilePageState();
  }
}

class profilePageState extends State<profilePage>{
  int _selectedIndex = 2;

  // List<Widget> _widgetOptions = <Widget>[
  // HomePage(),
  // AnnouncementPage(),
  // profilePage(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index == 1){
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => AnnouncementPage()));
      }
      else if(index == 2){
        Navigator.push(context, MaterialPageRoute(builder: (context) => profilePage()));
      }
      else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
      }
    });
  }


  Widget build(context){
    return MaterialApp(
      home: Scaffold(
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
        backgroundColor: Colors.deepPurple.shade100,
 
   ));
  }
}