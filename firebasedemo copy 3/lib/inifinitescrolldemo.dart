import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './db.dart';

class InfiniteScrollDemo extends StatefulWidget {
  @override
  _InfiniteScrollDemoState createState() => _InfiniteScrollDemoState();
}

class _InfiniteScrollDemoState extends State<InfiniteScrollDemo>
    with SingleTickerProviderStateMixin {
  ScrollController sc = ScrollController();
  Db db = Db();
  int numberOfRecordToBeFetch = 10;
  Future<List<DocumentSnapshot>> future;
  _fetchNextData({flag: false}) {
    future = db.getPaginatedData(numberOfRecordToBeFetch, flag);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchNextData();
    animationCtrl =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(animationCtrl);
    sc.addListener(() {
      if (sc.position.pixels == sc.position.maxScrollExtent) {
        setState(() {
          _fetchNextData();
        });

        print("Fetch Again");
      }
    });
  }

  AnimationController animationCtrl;
  Animation animation;
  _deleteRecord(documentId) {
    db.deleteSelectedRecord(documentId);
    print("record delted");
    setState(() {
      _fetchNextData(flag: true);
    });
  }

  _updateRecord() {
    setState(() {
      _fetchNextData(flag: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapShot) {
            if (snapShot.hasData == false) {
              return Center(child: CircularProgressIndicator());
//                child: AnimatedIcon(
//                    icon: AnimatedIcons.search_ellipsis,
//                    progress: animationCtrl),
//              );
            } else if (snapShot.hasError) {
              return Center(
                child: Text(
                  'Error During Fetching the Data from the server',
                  style: TextStyle(fontSize: 32),
                ),
              );
            }
            return ListView.builder(
              controller: sc,
              itemCount: snapShot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text(snapShot.data[index]['name']),
                  trailing: Wrap(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _deleteRecord(
                              snapShot.data[index].documentID,
                            );
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.update,
                            size: 20,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            db.updateSelectedRecord(
                                snapShot.data[index].documentID);
                            _updateRecord();
                          })
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
