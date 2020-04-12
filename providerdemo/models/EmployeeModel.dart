import 'package:flutter/material.dart';

import './Employee.dart';

class EmployeeModel extends ChangeNotifier {
  List<Employee> _empList = [];
  void addEmployee(int id, String name, double salary) {
    _empList.add(new Employee(id, name, salary));
    notifyListeners();
  }

  getEmployees() {
    return _empList;
  }
}
