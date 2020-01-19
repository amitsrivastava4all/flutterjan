import 'package:flutter/material.dart';

class Hello extends StatefulWidget {
  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  String firstName;
  String lastName;
  bool isPrint;
  Hello() {
    isPrint = false;
    firstName = lastName = "";
  }

  _getFirstName(str) {
    firstName = str;
  }

  _getLastName(str) {
    lastName = str;
  }

  TextField _getTextBox(String placeHolder, Function function) {
    return new TextField(
      onChanged: (str) {
        print("On Change Call is $str");
        function(str);
      },
      autocorrect: true,
      autofocus: true,
      decoration: InputDecoration(
          labelText: placeHolder,
          icon: Icon(
            Icons.person,
            color: Colors.red,
            size: 50,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  String _initCap(String str) {
    return str[0].toUpperCase() + str.substring(1).toLowerCase();
  }

  String fullName;
  printFullName() {
    fullName = _initCap(firstName) + " " + _initCap(lastName);
    print("Full Name is $fullName");

    setState(() {
      isPrint = true;
    });
  }

  Text _printLabel(bool isPrint) {
    print("#### IS PRINT IS $isPrint");
    if (fullName == null) {
      isPrint = false;
      return Text('');
    }
    //isPrint = true;
    print("IS PRINT IS $isPrint");
    return Text(
      fullName,
      style: TextStyle(color: Colors.red, fontSize: 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: _printLabel(isPrint),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: _getTextBox('What is Your First Name', _getFirstName),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: _getTextBox('What is Your Last Name', _getLastName),
            ),
            Container(
              child: RaisedButton(
                onPressed: printFullName,
                color: Colors.redAccent,
                child: Text(
                  'Say Hello',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
