import 'package:flutter/material.dart';

import './emi.dart';

//void main() {
//  runApp(MaterialApp(title: 'HelloApp2020',
//  home: Hello(),));
//}
void main() {
  runApp(MaterialApp(
    title: 'EMI APP',
    home: EmiApp(),
  ));
}

//import 'package:flutter/material.dart';
//
//TextStyle getStyle() {
//  return TextStyle(fontSize: 30, color: Colors.red);
//}
//
//Container getContainer(String txt) {
//  return Container(
//    padding: EdgeInsets.all(10),
//    height: 100,
//    width: 200,
//    margin: EdgeInsets.only(top: 100, left: 50),
//    color: Colors.lightGreen,
//    child: Text('$txt', style: getStyle()),
//  );
//}
//
//void main() {
//  runApp(MaterialApp(
//    title: 'App2020',
//    theme: ThemeData.light(),
//    home: Scaffold(
//      floatingActionButton: RaisedButton(
//        color: Colors.blueAccent,
//        shape: CircleBorder(side: BorderSide.none),
//        onPressed: () {},
//        child: Text(
//          '+',
//          style: TextStyle(fontSize: 20, color: Colors.black),
//        ),
//      ),
//      appBar: AppBar(
//        title: Text('My First App'),
//      ),
//      body: SingleChildScrollView(
//        child: Column(
//          children: <Widget>[
//            getContainer('Hello'),
//            getContainer('Hello'),
//            getContainer('Hello'),
//            getContainer('Hello'), getContainer('Hello'), getContainer('Hello'),
//            getContainer('Hello')
//
////            Row(
////              children: <Widget>[
////                getContainer('First'),
////                getContainer('Middle'),
////                getContainer('Last')
////              ],
////            ),
////            Row(
////              children: <Widget>[
////                getContainer('First'),
////                getContainer('Middle'),
////                getContainer('Last')
////              ],
////            )
//          ],
//        ),
//      ),
////      body: Container(
////        padding: EdgeInsets.all(50),
////        height: 200,
////        width: 200,
////        margin: EdgeInsets.only(top: 100, left: 50),
////        color: Colors.lightGreen,
////        child: Text('Hello', style: getStyle()),
////      ),
////      body: Column(
////        mainAxisAlignment: MainAxisAlignment.center,
////        crossAxisAlignment: CrossAxisAlignment.center,
////        children: <Widget>[
////          Text(
////            'Hello',
////            style: getStyle(),
////          ),
////          Text(
////            'Hi',
////            style: getStyle(),
////          ),
////          Text(
////            'OK',
////            style: getStyle(),
////          )
////        ],
////      ),
////      body: Center(
////          child: Text(
////        'Hello Flutter',
////        style: TextStyle(
////            fontSize: 30, fontWeight: FontWeight.w900, color: Colors.redAccent),
////      )),
//    ),
//  ));
////  runApp(MaterialApp(
////    title: 'App 2020',
////    home: Center(
////        child: Text(
////      'Hello App...',
////      style: TextStyle(color: Colors.yellowAccent, fontSize: 40),
////    )),
////  ));
//}
