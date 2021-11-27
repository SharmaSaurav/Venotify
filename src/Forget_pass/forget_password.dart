import 'package:flutter/material.dart';

// class ForgetPassPage extends StatefulWidget {
//   createState() {
//     return ForgetPassPageState();
//   }
// }

class ForgetPassword extends StatelessWidget {
  final formkey = GlobalKey<FormState>();

  String email = '';

  Widget build(context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        body: Form(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                child: Image.asset('assets/images/form.jpeg'),
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: 20.0,
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
                            margin: EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10),
                            child: emailField()),
                        Container(margin: EdgeInsets.only(top: 20.0)),
                        submitButton(),
                        Container(margin: EdgeInsets.only(top: 20.0)),
                      ],
                    ),
                  ))
            ])));
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Enter your Email Address',
        icon: Icon(
          Icons.mail,
          color: Colors.black38,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 5.0, right: 15.0),
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
