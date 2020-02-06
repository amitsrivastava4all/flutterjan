import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  String _hint;
  TextBox(this._hint);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextField(
        decoration: InputDecoration(
            hintText: _hint,
            hintStyle: TextStyle(fontSize: 30),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 10, color: Colors.red, style: BorderStyle.solid))),
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
