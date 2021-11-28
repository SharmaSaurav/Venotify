import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  var dropdownValue;

  Widget build(context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
            // margin: EdgeInsets.only(top: 200.0, left: 20, right: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/images/form.jpeg'),
                  ),
                  // Padding(padding: EdgeInsets.all(50.0)),
                  _buildLogo(),
                  Container(
                    margin: EdgeInsets.only(top: 15.0, left: 10, right: 10),
                    child: emailField(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0, left: 10, right: 10),
                    child: passwordField(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0, left: 10, right: 10),
                    child: loginAs(context),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0, left: 10, right: 10),
                    child: forgotPassword(),
                  ),
                  SubmitButton(),
                  Container(margin: EdgeInsets.only(top: 5.0)),
                  signUp(),
                ],
              ), //column
            ), // Form
          )
        ]));
    //container
  }

  Widget emailField() {
    // type of class for a form
    return TextFormField(
      // customising user keyboard for easy typing of email addresses
      keyboardType: TextInputType.emailAddress,
      //properties of the textFormField
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Email Address',
        hintText: 'yourname.branch20@pec.edu.in',
        border: OutlineInputBorder(),
      ), // InputDecoration
      validator: (value) {
        //return null if valid
        //return a string statement with an error message if invalid
        if (!value!.contains('@pec.edu.in')) {
          return 'Please enter a valid email';
        }
      },
      onSaved: (value) {
        email = value!;
      },
    );

    ///TextFormField
  }

  Widget passwordField() {
    return TextFormField(
      //hiding password
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: 'Password',
        hintText: 'Password',
        border: OutlineInputBorder(),
      ), //inputDecoration
      validator: (value) {
        if (value!.length < 4) {
          return 'Password must be atleast 4 characters';
        }
      },
      onSaved: (value) {
        password = value!;
      },
    );
  }

  Widget SubmitButton() {
    var child;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo[600], //bg color
        // padding: EdgeInsets.only(top: 20.0,bottom: 20,left: 40,right: 40),

        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          //fontStyle: FontStyle.italic,
        ),
      ),
      child: Text('LOGIN'),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print('login credentials are $email and $password.');
        }
      },
    );
  }

  Widget forgotPassword() {
    return TextButton(
      onPressed: () {
        //TO DO FORGOT PASSWORD SCREEN GOES HERE
      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.indigo[600], fontSize: 15),
      ),
    );
  }

  Widget signUp() {
    return TextButton(
      onPressed: () {
        //TO DO SIGN UP SCREEN GOES HERE
      },
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.indigo[600], fontSize: 15),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'LOGIN',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[600],
            ),
          ),
        )
      ],
    );
  }

  Widget loginAs(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_sharp),
      iconSize: 30,
      elevation: 10,
      style: const TextStyle(color: Colors.blueGrey),
      underline: Container(
        height: 2,
        color: Colors.indigo,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Student', 'Organizer']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text((value)),
        );
      }).toList(),
    );
  }
}
