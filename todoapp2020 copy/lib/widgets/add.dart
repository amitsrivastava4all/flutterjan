import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController _txt1 = new TextEditingController();
  TextEditingController _txt2 = new TextEditingController();
  TextEditingController _txt3 = new TextEditingController();
  _showDatePicker() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text('Add Item'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.20),
                child: Text(
                  'Add Item',
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
              ),
              Container(
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  controller: _txt1,
                ),
              ),
              Container(
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  controller: _txt2,
                ),
              ),
              Container(
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  controller: _txt3,
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Add Item'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
