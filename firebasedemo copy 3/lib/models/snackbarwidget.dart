import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
  SnackBar createSnackBar() {
    return SnackBar(
        content: Text('Hello User'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
        action: SnackBarAction(
            label: 'Ok',
            onPressed: () {
              print("U press Ok ");
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: IconButton(
        onPressed: () {
          // First Way of Creating SnackBar
          Scaffold.of(context).showSnackBar(createSnackBar());
        },
        icon: Icon(
          Icons.message,
          size: 40,
          color: Colors.yellowAccent,
        ),
      ),
    );

    ;
  }
}
