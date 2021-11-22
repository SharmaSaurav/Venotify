import 'package:flutter/material.dart';
import './signup.dart';

class LoginPage extends StatefulWidget {
  createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
            child: Image.asset('assets/images/form.jpg'),
          ),
          Container(
              margin: EdgeInsets.only(
                top: 200.0,
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
                  children: [
                    Container(margin: EdgeInsets.only(top: 10.0)),
                    emailField(),
                    Container(margin: EdgeInsets.only(top: 10.0)),
                    passwordField(),
                    Container(margin: EdgeInsets.only(top: 20.0)),
                    submitButton(),
                    Container(margin: EdgeInsets.only(top: 40.0)),
                    signupLink(),
                  ],
                ),
              ))
        ]));
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
      onSaved: (value) {
        password = value!;
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

  Widget signupLink() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              fontStyle: FontStyle.italic,
            ),
          ),
          onSignup(),
        ],
      ),
    );
  }

  Widget onSignup() {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => signupPage()));
      },
      child: Text(
        'Sign up!',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
