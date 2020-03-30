import 'dart:async';

import 'package:flutter/material.dart';

import './tabsdemo.dart';

class SplashScreenDemo extends StatefulWidget {
  @override
  _SplashScreenDemoState createState() => _SplashScreenDemoState();
}

class _SplashScreenDemoState extends State<SplashScreenDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 9), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TabsDemo()));
    });
  }

  @override
  Widget build(BuildContext context) {
    const url =
        "https://sportzwiki.com/wp-content/uploads/2018/09/The-Rock.jpg'";
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              maxRadius: 200,
              backgroundImage: NetworkImage(url),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Loading....',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      )),
    );
  }
}
