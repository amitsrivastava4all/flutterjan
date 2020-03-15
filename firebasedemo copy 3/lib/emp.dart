import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import './db.dart';
import './inifinitescrolldemo.dart';
import './models/employee.dart';
import './models/snackbarwidget.dart';
import './staticdatatable.dart';
import './utils/webviewdemo.dart';

class EmpScreen extends StatefulWidget {
  @override
  _EmpScreenState createState() => _EmpScreenState();
}

class _EmpScreenState extends State<EmpScreen> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  TextEditingController _tc1 = TextEditingController();
  TextEditingController _tc2 = TextEditingController();
  _collectData() {
    Employee emp = new Employee(_tc1.text, double.parse(_tc2.text));
    Db db = new Db();
    db.add(emp);
  }

  SnackBar createSnackBar() {
    return SnackBar(
        content: Text('Hello User'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
        action: SnackBarAction(
            label: 'Ok',
            onPressed: () {
              print("U press Ok ");
            }));
  }

  showCarsouel(context) {
    return SizedBox(
        height: 250.0,
        width: 400.0,
        child: Carousel(images: [
          NetworkImage(
              'https://car-pictures-download.com/wp-content/uploads/2018/03/car-pictures-favicon-ferrari.png'),
          NetworkImage(
              'https://car-pictures-download.com/wp-content/uploads/2018/03/car-pictures-favicon-ferrari.png')
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 3,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: 40,
                        )
                      ],
                    ),
                    flex: 2,
                  )
                ],
              ),
              decoration:
                  BoxDecoration(color: Colors.orange, border: Border.all()),
            )
          ],
        ),
      ),
      key: key,
      appBar: AppBar(
        title: Text('Firebase demo'),
        elevation: 5,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StaticDataTable()));
              },
              icon: Icon(Icons.table_chart, size: 30, color: Colors.pink),
            ),
          ),
          SnackBarWidget(),
          IconButton(
            icon: Icon(
              Icons.play_circle_filled,
              size: 30,
            ),
            onPressed: () {
              key.currentState.showSnackBar(createSnackBar());
            },
          ),
          IconButton(
              tooltip: 'Web',
              onPressed: () {
                print("Web Call");
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WebViewDemo()));
              },
              icon: Icon(
                Icons.web,
                size: 30,
                color: Colors.purple,
              )),
          Container(
            padding: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InfiniteScrollDemo()));
                // Navigator.of(context)
                //   .push(MaterialPageRoute(builder: (context) => EmpList()));
              },
              icon: Icon(
                Icons.view_list,
                size: 40,
                color: Colors.yellowAccent,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showCarsouel(context),
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(fontSize: 32),
                controller: _tc1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Type Name Here'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(fontSize: 32),
                //controller: _tc2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Type Salary Here'),
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    _collectData();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
