import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Employee.dart';
import '../models/EmployeeModel.dart';

class EmpList extends StatelessWidget {
  var empModel;
  @override
  Widget build(BuildContext context) {
    empModel = Provider.of<EmployeeModel>(context);
    List<Employee> empList = empModel.getEmployees();
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  'Name ${empList[index].name} Salary is ${empList[index].salary}'),
            );
          },
          itemCount: empList != null ? empList.length : 0),
    );
  }
}
