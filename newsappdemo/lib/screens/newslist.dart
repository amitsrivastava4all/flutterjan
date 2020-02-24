import 'dart:convert' as json;

import 'package:flutter/material.dart';

import '../models/news.dart';
import '../utils/callserver.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  giveMeData(data) {
    print("Data is $data");
    var jsonData = json.jsonDecode(data.body);
    print("JSON Data is ");
    print(jsonData);
    print("Total Records are ${jsonData["totalResults"]}");
    print(jsonData.runtimeType);
    //print(data.body);
    convertJSONTONews(jsonData);
  }

  Future<List<News>> convertJSONTONews(jsonData) {
    var array = jsonData["articles"];
    List<News> newsList = [];
    array.forEach((singleNews) {
      News news = new News(singleNews["title"], singleNews["description"],
          singleNews["urlToImage"]);
      newsList.add(news);
    });
    print("NEWS LIST IS $newsList");
    //return newsList;
    //News news = new News()
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Server.getHeadLines("in", giveMeData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News API '),
      ),
    );
  }
}
