import 'package:flutter/material.dart';
import './signup.dart';
import '../Forget_pass/forget_password.dart';

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
            child: Image.asset('assets/images/form.jpeg'),
          ),
          Container(
              margin: EdgeInsets.only(
                top: 20.0,
                bottom: 120.0,
                left: 20.0,
                right: 20.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                        margin:
                            EdgeInsets.only(top: 10.0, left: 10.0, right: 10),
                        child: emailField()),
                    Container(
                        margin:
                            EdgeInsets.only(top: 10.0, left: 10.0, right: 10),
                        child: passwordField()),
                    Container(margin: EdgeInsets.only(top: 20.0)),
                    submitButton(),
                    Container(margin: EdgeInsets.only(top: 20.0)),
                    forgotPasswordField(),
                    Container(margin: EdgeInsets.only(top: 20.0)),
                    signupLink(),
                    Container(margin: EdgeInsets.only(top: 20.0))
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
      keyboardType: TextInputType.text,
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
        primary: Colors.purple.shade900,
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
          color: Colors.purple,
        ),
      ),
    );
  }

  Widget forgotPasswordField() {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ForgetPassword()));
      },
      child: Text(
        'Forgot password?',
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.purple,
        ),
      ),
    );
  }
}
