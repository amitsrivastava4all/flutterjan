import 'package:cloud_firestore/cloud_firestore.dart';

import './models/employee.dart';

class Db {
  final dbRef = Firestore.instance;
  add(Employee emp) async {
    DocumentReference df =
        await dbRef.collection("emps").add(emp.convertIntoMap());
    print("Added ${df.documentID}");
  }
}
