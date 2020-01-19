import 'package:flutter/material.dart';

class EmiApp extends StatefulWidget {
  @override
  _EmiAppState createState() => _EmiAppState();
}

class _EmiAppState extends State<EmiApp> {
  String val;
  TextEditingController tc = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMI APP'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(val ?? ''),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Text('EMI App', style: TextStyle(fontSize: 30)),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: tc,
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  autofocus: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.done,
                        color: Colors.red,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Container(
                child: Switch(
                    value: true,
                    onChanged: (currentValue) {
                      print("value is $currentValue");
                    }),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Colors.yellowAccent,
                shape: Border.all(
                    width: 3,
                    color: Colors.redAccent,
                    style: BorderStyle.solid),
                onPressed: () {
                  setState(() {
                    val = tc.text;
                  });
                  print("Text Box Value is ${tc.text}");
                },
                child: Text(
                  'Compute',
                  style: TextStyle(fontSize: 30, color: Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
