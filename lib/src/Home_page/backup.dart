import 'package:flutter/material.dart';
import 'dart:async';
import '../resources/repo.dart';
import '../models/announcement_model.dart';
import 'package:intl/intl.dart';
import '../resources/api_provider.dart';
import 'dart:developer';

NewsApiProvider api = NewsApiProvider();
AnnouncementModel? announcement;

Future<void> data() async {
  announcement = await api.fetchAnnouncmentsApi();
  print(announcement!.Date_);
  print(announcement!.Description);
}

void showConsoleUsingPrint() {
  data(); // should print out itemModel
}

class HomePage extends StatefulWidget {
  createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  // final formKey = GlobalKey<FormState>();

  String date = '';

  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.purple[50],
            appBar: AppBar(
              backgroundColor: Colors.purple,
              toolbarHeight: 40.0,
              centerTitle: true,
              title: Text(
                'Home Page',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            body: SingleChildScrollView(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Container(
                    // margin: EdgeInsets.only(top: 200.0, left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 280,
                          width: 300,
                          margin: EdgeInsets.only(left: 50, right: 50, top: 30),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://yt3.ggpht.com/ytc/AKedOLT3xopdGe6plCeD_YoWlrMTmPoQaJU1lKDVPLV9=s900-c-k-c0x00ffffff-no-rj'),
                                height: 240,
                                width: 300,
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'ACM CSS',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(padding: EdgeInsets.all(50.0)),
                        Container(
                          child: _buildLogo(),
                        )
                      ],
                    ), //column
                  ), // Form
                ]))));
    //container
  }

  Widget _buildLogo() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(top: 40, right: 150),
            child: (Text(
              'Your Announcements',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 40,
                fontWeight: FontWeight.bold,
                color: Colors.purple[600],
              ),
            )
                // have to add a date widget here in row
                )),
        // Container(),
        // announcements(),
        // announcements(),
        // announcements(),
        // // placeholders
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20, right: 150),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
          ),
          // child: (Text('pic_of_platform  title   date')),
          child: Row(children: [
            Icon(Icons.alarm),
            Text("  Ideathon    1/12/21")
            // Text(announcement!.Description),
            // Text(announcement!.Date_),
          ]),
        ),
        Container(
          margin: EdgeInsets.only(top: 25.0, left: 20, right: 150),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
          ),
          // child: (Text('pic_of_platform  title   date')),
          child: Row(children: [
            Icon(Icons.alarm),
            Text("  Workshop    1/12/21")
            // Text(announcement!.Description),
            // Text(announcement!.Date_),
          ]),
        ),
        Container(
          margin: EdgeInsets.only(top: 25.0, left: 20, right: 150),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
          ),
          // child: (Text('pic_of_platform  title   date')),
          child: Row(children: [
            Icon(Icons.alarm),
            Text("  Orientation    13/12/21")
            // Text(announcement!.Description),
            // Text(announcement!.Date_),
          ]),
        ),
        // just for testing the api data
        // Container(
        //     margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        //     child: ElevatedButton(
        //       onPressed: () => showConsoleUsingPrint(),
        //       child: Text(' Print Console Message using Print '),
        //     ))
      ],
    );
  }
}

Widget announcements() {
  AnnouncementModel? announcement;
  data();
  print(announcement!.Organiser);
  return Container(
    margin: EdgeInsets.only(top: 25.0, left: 20, right: 150),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      color: Colors.white,
    ),
    // child: (Text('pic_of_platform  title   date')),
    child: Row(children: [
      Icon(Icons.alarm),
      Text(announcement.Description),
      Text("       "),
      Text(announcement.Date_)
      // Text(announcement!.Description),
      // Text(announcement!.Date_),
    ]),
  );
}
