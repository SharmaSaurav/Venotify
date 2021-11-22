import 'package:flutter/material.dart';

class signupPage extends StatefulWidget {
  createState() {
    return signupPageState();
  }
}

class signupPageState extends State<signupPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String name = '';
  String sid = '';
  String branch = '';
  String year = '';
  String phoneno = '';
  String email = '';
  String signupas_ = ' ';
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  String designation = '';

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade400,
          toolbarHeight: 40.0,
          centerTitle: true,
          title: Text(
            'Sign Up!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.black,
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
                  color: Colors.green.shade100,
                  border: Border.all(
                    color: Colors.black87,
                    width: 5.0,
                  ),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      signupasField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      nameField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      sidField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      // branchField(),
                      // Container(margin: EdgeInsets.only(top: 10.0)),
                      // yearField(),
                      // Container(margin: EdgeInsets.only(top: 10.0)),
                      // mobileField(),
                      // Container(margin: EdgeInsets.only(top: 10.0)),
                      emailField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      passwordField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      confirmpasswordField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      // designationField(),
                      // Container(margin: EdgeInsets.only(top: 10.0)),
                      // clubsandsocietiesField(),
                      // Container(margin: EdgeInsets.only(top: 10.0)),
                      submitButton(),
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

  Widget nameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'name',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value!.length <= 0) {
          return 'Please enter your name!';
        }
      },
      onSaved: (value) {
        name = value!;
      },
    );
  }

  Widget sidField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'SID',
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'sid',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value!.length != 8) {
          return 'Please enter a valid SID!';
        }
      },
      onSaved: (value) {
        sid = value!;
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'example@pec.edu.in',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (!value!.contains('@pec.edu.in')) {
          return 'please enter a valid email id!';
        }
      },
      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'password',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value!.length < 8) {
          return 'password must be atleast 8 characters long';
        }
      },
    );
  }

  Widget confirmpasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'your password',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value! != password.text) {
          return "passwords don't match!";
        }
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey.shade900,
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

  Widget signupasField() {
    return DropdownButton<String>(
        value: signupas_,
        icon: Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: 15,
        iconDisabledColor: Colors.grey.shade400,
        iconEnabledColor: Colors.black,
        disabledHint: Text('signup as'),
        underline: Container(
          color: Colors.black,
          height: 2.0,
        ),
        onChanged: (newValue) {
          setState(() {
            signupas_ = newValue!;
          });
        },
        items: ['Student', 'Organizer'].map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: signupas_,
              child: Text(value),
            );
          },
        ).toList());
  }
}
