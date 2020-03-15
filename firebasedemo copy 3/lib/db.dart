import 'package:cloud_firestore/cloud_firestore.dart';

import './models/employee.dart';

class Db {
  final dbRef = Firestore.instance;
  getDBRef() {
    return dbRef;
  }

  updateSelectedRecord(documentId) async {
    Map<String, dynamic> map = {"name": 'RAM1', "salary": 8888};
    await dbRef.collection('emps').document(documentId).updateData(map);
  }

  deleteSelectedRecord(documentId) async {
    await dbRef.collection('emps').document(documentId).delete();
  }

  DocumentSnapshot lastDoc;
  QuerySnapshot result;
  List<DocumentSnapshot> empList = [];
  Future<List<DocumentSnapshot>> getPaginatedData(records, deleteFlag) async {
    if (deleteFlag) {
      Query query = dbRef.collection('emps').orderBy('name').limit(records);
      result = await query.getDocuments();
      lastDoc = result.documents[result.documents.length - 1];
      print("Inside Delete If ....$deleteFlag");
    } else if (lastDoc == null) {
      Query query = dbRef.collection('emps').orderBy('name').limit(records);
      result = await query.getDocuments();
      lastDoc = result.documents[result.documents.length - 1];
      print("Inside IF result is $result and lastDoc is $lastDoc");
    } else {
      print("Inside Else ");
      Query query = dbRef
          .collection('emps')
          .orderBy('name')
          .startAfter([lastDoc.data['name']]).limit(records);

      result = await query.getDocuments();
      print("Now Result is...... $result");
      if (result.documents.length == 0) {
        return empList;
      }
      lastDoc = result.documents[result.documents.length - 1];
    }
    print("Result is ${result.documents.length}");
    //print("Result $result");
    //List<DocumentSnapshot> empList = result.documents;
    if (deleteFlag) {
      empList = [];
      empList.addAll(result.documents);
      return empList;
    }
    if (result.documents.length == 0) {
      return empList;
    }
    empList.addAll(result.documents);
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
