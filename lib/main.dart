import 'package:flutter/material.dart';

TextStyle getStyle() {
  return TextStyle(fontSize: 30, color: Colors.red);
}

void main() {
  runApp(MaterialApp(
    title: 'App2020',
    theme: ThemeData.light(),
    home: Scaffold(
      floatingActionButton: RaisedButton(
        color: Colors.blueAccent,
        shape: CircleBorder(side: BorderSide.none),
        onPressed: () {},
        child: Text(
          '+',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Hello',
            style: getStyle(),
          ),
          Text(
            'Hi',
            style: getStyle(),
          ),
          Text(
            'OK',
            style: getStyle(),
          )
        ],
      ),
//      body: Center(
//          child: Text(
//        'Hello Flutter',
//        style: TextStyle(
//            fontSize: 30, fontWeight: FontWeight.w900, color: Colors.redAccent),
//      )),
    ),
  ));
//  runApp(MaterialApp(
//    title: 'App 2020',
//    home: Center(
//        child: Text(
//      'Hello App...',
//      style: TextStyle(color: Colors.yellowAccent, fontSize: 40),
//    )),
//  ));
}
