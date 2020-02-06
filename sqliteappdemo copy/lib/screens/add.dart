import 'package:flutter/material.dart';

import './view.dart';
import './widgets/datepicker.dart';
import './widgets/textbox.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
  void _moveToViewScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ViewScreen()));
  }
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Screen'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              widget._moveToViewScreen(context);
            },
            icon: Icon(
              Icons.featured_play_list,
              size: 30,
              color: Colors.yellow,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextBox('Type Name Here'),
            TextBox('Type Salary Here'),
            DatePicker()
          ],
        ),
      ),
    );
  }
}
