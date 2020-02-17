import 'package:flutter/material.dart';

import './db.dart';
import './models/employee.dart';

class EmpScreen extends StatefulWidget {
  @override
  _EmpScreenState createState() => _EmpScreenState();
}

class _EmpScreenState extends State<EmpScreen> {
  TextEditingController _tc1 = TextEditingController();
  TextEditingController _tc2 = TextEditingController();
  _collectData() {
    Employee emp = new Employee(_tc1.text, double.parse(_tc2.text));
    Db db = new Db();
    db.add(emp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(fontSize: 32),
                controller: _tc1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Type Name Here'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(fontSize: 32),
                controller: _tc2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Type Salary Here'),
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    _collectData();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
