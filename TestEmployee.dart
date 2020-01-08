import './Employee.dart';
void main(){
  Employee emp = Employee();
  emp.printing();
  Employee emp2 = Employee.createEmp(111,"Ram",9999);
  emp2.printing();
  emp2.salary = 1199999;
  print("now new salary is ${emp2.salary}");
}