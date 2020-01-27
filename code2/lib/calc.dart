import 'package:flutter/material.dart';

import './widgets/row.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String msg = null;
  printNumber(String txt) {
    setState(() {
      if (msg == null) {
        msg = txt;
      } else {
        msg += txt;
      }
    });
    print("Button Pressed ${txt}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Text(
                msg ?? "0",
                style: TextStyle(fontSize: 40),
              ),
              CalcRow("7", "8", "9", "/", printNumber),
              CalcRow("6", "5", "4", "-", printNumber)
            ],
          ),
        ),
      ),
    );
  }
}
