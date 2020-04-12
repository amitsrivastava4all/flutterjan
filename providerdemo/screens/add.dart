import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/EmployeeModel.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController salaryCtrl = TextEditingController();
  var empModel;
  _addData() {
    var name = nameCtrl.text;
    var salary = double.parse(salaryCtrl.text);
    empModel.addEmployee(10, name, salary);
  }

  @override
  Widget build(BuildContext context) {
    empModel = Provider.of<EmployeeModel>(context);
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            controller: nameCtrl,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(hintText: 'type name here'),
          ),
          TextField(
            controller: salaryCtrl,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(hintText: 'type Salary here'),
          ),
          RaisedButton(
            child: Text('Add'),
            onPressed: () {
              _addData();
            },
          )
        ],
      ),
    );
  }
}
