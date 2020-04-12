import 'package:flutter/material.dart';

import './add.dart';
import './emplist.dart';

class EmployeeMain extends StatefulWidget {
  @override
  _EmployeeMainState createState() => _EmployeeMainState();
}

class _EmployeeMainState extends State<EmployeeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[Add(), EmpList()],
        ),
      ),
    );
  }
}
