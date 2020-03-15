import 'package:flutter/material.dart';

class PageViewDemo extends StatelessWidget {
  PageController ctrl = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: ctrl,
        children: <Widget>[],
      ),
    );
  }
}
