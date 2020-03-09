import 'package:cloud_firestore/cloud_firestore.dart';

import './models/employee.dart';

class Db {
  final dbRef = Firestore.instance;
  getDBRef() {
    return dbRef;
  }

  Future<List<DocumentSnapshot>> getPaginatedData() async {
    Query query = dbRef.collection('emps').orderBy('name').limit(10);
    QuerySnapshot result = await query.getDocuments();
    List<DocumentSnapshot> empList = result.documents;
    return empList;
  }

  getAllRecordsSnapShot() {
    return dbRef.collection("emps").snapshots();
  }

  add(Employee emp) async {
    DocumentReference df =
        await dbRef.collection("emps").add(emp.convertIntoMap());
    print("Added ${df.documentID}");
  }
}
