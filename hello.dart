import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                autocorrect: true,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'What is your first name',
                    icon: Icon(
                      Icons.person,
                      color: Colors.red,
                      size: 50,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.redAccent,
                child: Text(
                  'Say Hello',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
