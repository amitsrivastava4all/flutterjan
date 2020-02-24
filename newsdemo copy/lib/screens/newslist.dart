import 'dart:convert' as json;

import 'package:flutter/material.dart';

import '../models/news.dart';
import '../utils/callserver.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  giveMeData(response) {
    print("Data is $response");
    var jsonData = json.jsonDecode(response.body);
    print("JSON Data is ");
    print(jsonData);
    print("Total Records are ${jsonData["totalResults"]}");
    print(jsonData.runtimeType);

    return jsonData;
  }

  Future<List<News>> convertJSONTONews() async {
    print("Convert JSON to News Called");
    List<News> newsList = [];
    var response = await Server.getHeadLinesAsync("in");

    var jsonData = giveMeData(response);
    print("JSON Data is $jsonData");
    var array = jsonData["articles"];

    array.forEach((singleNews) {
      News news = new News(singleNews["title"], singleNews["description"],
          singleNews["urlToImage"]);
      newsList.add(news);
    });
    print("NEWS LIST IS $newsList");

    return newsList;
    //News news = new News()
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Server.getHeadLines("in", giveMeData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News API '),
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: convertJSONTONews,
          child: FutureBuilder(
            builder: (context, asyncSnapShot) {
              if (asyncSnapShot.data == null) {
                return Container(
                  child: Text(
                    'Loading....',
                    style: TextStyle(fontSize: 40),
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(),
                      child: Text(
                        asyncSnapShot.data[index].title,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  );
                },
                itemCount: asyncSnapShot.data.length,
              );
            },
            future: convertJSONTONews(),
          ),
        ),
      ),
    );
  }
}
