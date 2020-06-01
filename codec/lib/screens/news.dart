import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../utils/Server.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<dynamic> listOfNews = [];

  callNews() {
    print("Call News Called....");
    Future<Response> future = Server.getNews();
    future.then((response) {
      Map<String, dynamic> map = convert.jsonDecode(response.body);
      print("::::Map is ${map['articles'][0]}");
      setState(() {
        listOfNews = map['articles'];
      });
    }).catchError((err) {
      print("Error Occur $err");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init State call once ur app is loaded...");
    callNews();
  }

  List<Widget> createNewsRows() {
    List<Widget> rows = listOfNews.map((currentNews) {
      String authorName = currentNews['author'];
      String titleName = currentNews['title'];
      String url = currentNews['urlToImage'];

      Row row = Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.network(url),
          ),
          Expanded(
            flex: 2,
            child: Text(titleName),
          )
        ],
      );
      return Padding(padding: EdgeInsets.all(5), child: row);
      //return row;
    }).toList();
    return rows;
  }

  Widget prepareNews() {
    List<Widget> widgets = [];
    if (listOfNews.length == 0) {
//      widgets.add(Center(
//        child: CircularProgressIndicator(),
//      ));
      return Container(
          width: media.width,
          height: media.height,
          child: Center(
            child: CircularProgressIndicator(),
          ));
    } else {
      return Column(
        children: createNewsRows(),
      );
//      widgets.add(Text(
//        'Data is Here',
//        style: TextStyle(fontSize: 32),
//      ));
    }
  }

  var media;
  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    print("Rendering time");
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: SingleChildScrollView(
        child: prepareNews(),
      ),
    );
  }
}
