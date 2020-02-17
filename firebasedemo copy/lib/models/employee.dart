class Employee {
  String _name;
  double _salary;
  Employee(this._name, this._salary);

  double get salary => _salary;
  Map<String, dynamic> convertIntoMap() {
    Map<String, dynamic> map = {"name": this._name, "salary": this._salary};
    return map;
  }

  set salary(double value) {
    _salary = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return 'Employee{_name: $_name, _salary: $_salary}';
  }
}
