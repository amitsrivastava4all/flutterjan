
class Employee{
  int id =0;
  String _name;
  double _salary;
  Employee(){
    id++;
    print("I am Default Cons");
  }
  void set salary(double salary){
    if(salary<=0){
      print("Can't set salary it is 0 to negative");
      return ;
    }
    this._salary = salary;
    print("Salary set ");
  }
  double get salary{
    print("Salary get");
    return this._salary;
  }
  void set name(String name){
    this._name = name;
  }
  String get name{
    return this._name;
  }
  Employee.createEmp(this.id, this._name, this._salary);
  //Employee(this.id , this.name, this.salary);
  void printing(){
    print("Id is $id Name is $_name Salary is $_salary");
  }
}