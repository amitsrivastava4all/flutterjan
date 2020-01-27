import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Color _color;
  double _fontsize;
  String _txt;
  Function fn;
  Button(String txt, Function fn,
      {double fontsize: 40, Color color: Colors.lightGreen}) {
    this._color = color;
    this._fontsize = fontsize;
    this._txt = txt;
    this.fn = fn;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
      color: this._color,
      child: Text(
        _txt,
        style: TextStyle(
          fontSize: _fontsize,
        ),
      ),
      onPressed: () {
        fn(_txt);
      },
      shape: CircleBorder(
          side: BorderSide(style: BorderStyle.solid, color: Colors.redAccent)),
    ));
  }
}
