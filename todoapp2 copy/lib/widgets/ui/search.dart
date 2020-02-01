import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  Function _fn;
  SearchBox(Function fn) {
    this._fn = fn;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: _fn,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Search',
            hintText: 'Type to Search'),
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
