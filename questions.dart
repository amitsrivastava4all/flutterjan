import 'dart:convert' as json;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  String name = "";
  String ans = "";
  getAllQuestions() async {
    var result = null;

    const url =
        'https://raw.githubusercontent.com/amitsrivastava4all/flutterjan/master/question.json';
    try {
      result = await http.get(url);
      //print(result.body.runtimeType);
      var object = json.jsonDecode(result.body);
      setState(() {
        name = object['questions'][0]["name"];
        for (int i = 0; i < object['questions'][0]["options"].length; i++) {
          ans = ans + " " + object['questions'][0]["options"][i]["name"];
        }
        // ans = object['questions'][0]["options"][0]["name"];
      });
      //print("Result is ${result['questions']}");
    } catch (err) {
      print("Error is $err");
    }
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future future = getAllQuestions();
    future.then((data) {
      print("Data is $data");
    }).catchError((err) {
      print("Error is $err");
    });
  }

  get10TextFields() {
    var list = [];
    for (int i = 1; i <= 10; i++) {
      list.add(new TextField(
        key: Key(i.toString()),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question App'),
      ),
//      body: Column(
//        children: <Widget>[
//          //get10TextFields()
//        ],
//      ),

      body: Column(
        children: <Widget>[Text(name), Text(ans)],
      ),
    );
  }
}
