import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsDemo extends StatefulWidget {
  @override
  _GpsDemoState createState() => _GpsDemoState();
}

class _GpsDemoState extends State<GpsDemo> {
  String msg = '';
  _giveCordinates() async {
    print("I am in giveCordinates");
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      msg = 'Pos is ${position.latitude} and ${position.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Demo'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _giveCordinates();
            },
            child: Text(
              'GPS ${msg}',
              style: TextStyle(fontSize: 32),
            ),
          )
        ],
      ),
    );
  }
}
