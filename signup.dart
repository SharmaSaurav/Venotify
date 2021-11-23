import 'package:flutter/material.dart';
import './clubs.dart';

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog(
      {Key? key, required this.items, required this.initialSelectedValues})
      : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        TextButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked!),
    );
  }
}

void _showMultiSelect(BuildContext context) async {
  clubsinlist = {};
  populateclubs();
  final items = clubsinlist;

  final selectedValues = await showDialog<Set<int>>(
    context: context,
    builder: (BuildContext context) {
      return MultiSelectDialog(
        items: clubs,
        initialSelectedValues: [1].toSet(),
      );
    },
  );

  print(selectedValues);
  //prnts selected values on console
  //will need to add different function to save them
  //getvaluefromkey(selectedValues!);
}

// void getvaluefromkey(Set selection) {
//   if (selection != null) {
//     for (int i in selection.toList()) {
//       print(clubsinlist[i]);
//     }
//     ;
//   }
// }

class signupPage extends StatefulWidget {
  createState() {
    return signupPageState();
  }
}

class signupPageState extends State<signupPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String name = '';
  String sid = '';
  String branch = 'cse';
  String year = 'Btech 1st';
  String phoneno = '';
  String email = '';
  String signupas_ = 'Student';
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  String designation = 'Secretary';

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        appBar: AppBar(
          backgroundColor: Colors.purple.shade900,
          toolbarHeight: 40.0,
          centerTitle: true,
          title: Text(
            'Sign Up!',
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
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'Sign up as:',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            signupasField(),
                          ],
                        ),
                        padding: EdgeInsets.only(
                          right: 150.0,
                          left: 20.0,
                        ),
                      ),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      nameField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      sidField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'Branch:     ',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            branchField(),
                          ],
                        ),
                        padding: EdgeInsets.only(
                          right: 150.0,
                          left: 20.0,
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'Year:        ',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            yearField(),
                          ],
                        ),
                        padding: EdgeInsets.only(
                          right: 150.0,
                          left: 20.0,
                        ),
                      ),
                      mobileField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      emailField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      passwordField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      confirmpasswordField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'Designation:  ',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            designationField(),
                          ],
                        ),
                        padding: EdgeInsets.only(
                          right: 150.0,
                          left: 20.0,
                        ),
                      ),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      clubsandsocietiesField(),
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

  Widget mobileField() {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.phone,
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
        labelText: 'Phone no.',
        icon: Icon(
          Icons.phone,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'your phone no',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value!.length != 10) {
          return 'Please enter a valid phone number!';
        }
      },
      onSaved: (value) {
        phoneno = value!;
      },
    );
  }

  Widget nameField() {
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
        labelText: 'Name',
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
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
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
        labelText: 'SID',
        icon: Icon(
          Icons.account_circle,
          color: Colors.black,
        ),
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
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
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
        labelText: 'Email Address',
        icon: Icon(
          Icons.email,
          color: Colors.black,
        ),
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
      controller: password,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      obscureText: true,
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
        labelText: 'Password',
        icon: Icon(
          Icons.lock,
          color: Colors.black,
        ),
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
      controller: confirm_password,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      obscureText: true,
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
        labelText: 'Confirm Password',
        icon: Icon(
          Icons.lock,
          color: Colors.black,
        ),
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

  Widget signupasField() {
    return DropdownButton<String>(
      value: signupas_,
      icon: Icon(Icons.keyboard_arrow_down_outlined),
      iconSize: 15,
      iconDisabledColor: Colors.grey.shade400,
      iconEnabledColor: Colors.black87,
      hint: Text('signup as'),
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.black,
      ),
      underline: Container(
        color: Colors.purple,
        height: 1.0,
      ),
      onChanged: (newValue) {
        setState(() {
          signupas_ = newValue!;
        });
      },
      items: [
        'Student',
        'Organizer',
      ].map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }

  Widget yearField() {
    return DropdownButton<String>(
      value: year,
      icon: Icon(Icons.keyboard_arrow_down_outlined),
      iconSize: 15,
      iconDisabledColor: Colors.grey.shade400,
      iconEnabledColor: Colors.black87,
      hint: Text('Select year'),
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.black,
      ),
      underline: Container(
        color: Colors.purple,
        height: 1.0,
      ),
      onChanged: (newValue) {
        setState(() {
          year = newValue!;
        });
      },
      items: [
        'Btech 1st',
        'Btech 2nd',
        'Btech 3rd',
        'Btech 4th',
      ].map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }

  Widget branchField() {
    return DropdownButton<String>(
      value: branch,
      icon: Icon(Icons.keyboard_arrow_down_outlined),
      iconSize: 15,
      iconDisabledColor: Colors.grey.shade400,
      iconEnabledColor: Colors.black87,
      hint: Text('Select branch'),
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.black,
      ),
      underline: Container(
        color: Colors.purple,
        height: 1.0,
      ),
      onChanged: (newValue) {
        setState(() {
          branch = newValue!;
        });
      },
      items: [
        'cse',
        'ee',
        'ece',
        'aero',
        'civil',
        'mech',
        'prod',
        'meta',
      ].map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }

  Widget designationField() {
    return DropdownButton<String>(
      value: designation,
      icon: Icon(Icons.keyboard_arrow_down_outlined),
      iconSize: 15,
      iconDisabledColor: Colors.grey.shade400,
      iconEnabledColor: Colors.black87,
      hint: Text('signup as'),
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.black,
      ),
      underline: Container(
        color: Colors.purple,
        height: 1.0,
      ),
      onChanged: (newValue) {
        setState(() {
          designation = newValue!;
        });
      },
      items: [
        'Secretary',
        'Joint Secretary',
      ].map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }

  Widget clubsandsocietiesField() {
    return TextButton(
      onPressed: () => _showMultiSelect(context),
      child: Row(
        children: [
          Text(
            'Select your clubs and societies!',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.black,
            size: 15,
          ),
        ],
      ),
    );
  }
}
