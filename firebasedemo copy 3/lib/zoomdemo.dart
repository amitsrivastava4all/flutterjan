import 'package:flutter/material.dart';

class ZoomDemo extends StatefulWidget {
  @override
  _ZoomDemoState createState() => _ZoomDemoState();
}

class _ZoomDemoState extends State<ZoomDemo> {
  double x, y;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('zoom'),
      ),
      body: Center(
          child: GestureDetector(
        onScaleStart: (scale) {
          print("Scale Start");
        },
        onScaleUpdate: (ScaleUpdateDetails scale) {
          setState(() {
            x = scale.verticalScale;
            y = scale.horizontalScale;
            print("Scale Update");
          });
        },
        child: Text(
          'Hello',
          style: TextStyle(fontSize: x),
        ),
      )
          //Zoom(height: 1800, width: 1800, child: Text('Hello')),
          ),
    );
  }
}
