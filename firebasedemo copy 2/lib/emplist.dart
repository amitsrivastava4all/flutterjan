import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './db.dart';

class EmpList extends StatefulWidget {
  @override
  _EmpListState createState() => _EmpListState();
}

class _EmpListState extends State<EmpList> {
  Db db = new Db();
  TextEditingController tc;
  ScrollController sc = ScrollController();

  _getSearchBox() {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: TextField(
                  controller: tc,
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                      hintText: 'Type Value to Search',
                      hintStyle: TextStyle(fontSize: 24),
                      contentPadding: EdgeInsets.only(left: 30),
                      border: InputBorder.none)),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  attachControllerListener() {
    sc.addListener(() {
      if (sc.position.pixels == sc.position.maxScrollExtent) {
        // Http Call
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    attachControllerListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder with FireBase App'),
        elevation: 5,
        bottom: PreferredSize(
            child: _getSearchBox(), preferredSize: Size.fromHeight(60)),
      ),
      body: StreamBuilder(
        stream: db.getAllRecordsSnapShot(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: snapshot.data.documents.map((document) {
              return ListTile(
                title: Text(document['name']),
                subtitle: Text(document['salary'].toString()),
              ); //ListTile
            }).toList(),
          );
//          return ListView(
//            controller: sc,
//            children: snapshot.data.documents.map((document) {
//              return ListTile(
//                title: Text(document['name']),
//                subtitle: Text(document['salary'].toString()),
//              ); //ListTile
//            }).toList(),
//          ); // ListView
        },
      ),
    );
  }
}
