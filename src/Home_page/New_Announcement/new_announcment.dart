import 'package:flutter/material.dart';
import '../home_page.dart';
import '../profile_page.dart';

class AnnouncementPage extends StatefulWidget {
  createState() {
    return AnnouncementPageState();
  }
}

class AnnouncementPageState extends State<AnnouncementPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String Organiser = '';
  String Time = '';
  String Date_ = '';
  String Place = '';
  String Description = '';
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  // String designation = 'Secretary';

  int _selectedIndex = 1;

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
            context, MaterialPageRoute(builder: (context) => homePage()));
      }
    });
  }

  Widget build(context) {
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
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey.shade300,
          iconSize: 24.0,
          elevation: 8.0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.purple.shade900,
          toolbarHeight: 40.0,
          centerTitle: true,
          title: Text(
            'New Announcement!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 100.0,
                  bottom: 120.0,
                  left: 20.0,
                  right: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                        child: organiserField(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                        child: PlaceField(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                        child: Timefield(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                        child: Datefield(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                        child: descriptionField(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20),
                        // child: clubsandsocietiesField(),
                      ),
                      Container(margin: EdgeInsets.only(top: 20.0)),
                      submitButton(),
                      Container(margin: EdgeInsets.only(top: 40.0)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget organiserField() {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        labelText: 'Organiser',
        icon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'ACMCSS',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value!.length <= 0) {
          return "Please enter your Club's name!";
        }
      },
      onSaved: (value) {
        Organiser = value!;
      },
    );
  }

  Widget PlaceField() {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        labelText: 'Place',
        icon: Icon(
          Icons.house_rounded,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'Gmeet,Webex,NBA etc',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value!.length <= 0) {
          return 'Please enter a valid Place!';
        }
      },
      onSaved: (value) {
        Place = value!;
      },
    );
  }

  Widget Timefield() {
    return TextFormField(
      cursorColor: Colors.black,
      // keyboardType: TextInputType.emailAddress,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        labelText: 'Time',
        icon: Icon(
          Icons.alarm,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'HH:MM am/pm',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (!value!.contains('am') || !value.contains('pm')) {
          return 'please valid time as in 9:00 am';
        } // have to take care time is not > 24
      },
      onSaved: (value) {
        Time = value!;
      },
    );
  }

  Widget Datefield() {
    return TextFormField(
      cursorColor: Colors.black,
      // keyboardType: TextInputType.emailAddress,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        labelText: 'Date',
        icon: Icon(
          Icons.calendar_today_rounded,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'DD-MM-YYYY',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      // validator: (value) {
      //   if (!value!.contains('am') || !value!.contains('pm') ) {
      //     return 'please valid time as in 9:00 am';
      //   } // have to take care time is not > 24
      // },
      onSaved: (value) {
        Time = value!;
      },
    );
  }

  Widget descriptionField() {
    return TextFormField(
      // controller: password,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      // obscureText: true,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        labelText: 'Announcement ',
        icon: Icon(
          Icons.speaker_notes,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'All the members are notified that...',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      // validator: (value) {
      //   if (value!.length < 8) {
      //     return 'password must be atleast 8 characters long';
      //   }
      // },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.purple,
        padding: EdgeInsets.all(15.0),
        textStyle: TextStyle(
          color: Colors.white10,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        if (formkey.currentState!.validate()) {
          formkey.currentState!.save();
          print('alldone');
        }
      },
      child: Text('Submit'),
    );
  }
}
