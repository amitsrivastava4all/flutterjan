import 'package:flutter/material.dart';

import './button.dart';

class CalcRow extends StatelessWidget {
  String first;
  String second;
  String third;
  String fourth;
  Function fn;
  CalcRow(String this.first, String this.second, String this.third,
      String this.fourth, Function this.fn);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: <Widget>[
            Button(first, fn),
            Button(second, fn),
            Button(third, fn),
            Button(fourth, fn)
          ],
        ));
  }
}
