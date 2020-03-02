import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/server.dart';

class ListGif extends StatefulWidget {
  @override
  _ListGifState createState() => _ListGifState();
}

class _ListGifState extends State<ListGif> {
  Timer _debounce;
  String searchTxt = 'Tom and Jerry';
  handleTxtBoxValue(String str) {
    setState(() {
      print("Set State Call");
      searchTxt = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build called ....");
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
        bottom: PreferredSize(
            child: Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                onChanged: (str) {
                  if (_debounce?.isActive ?? false) _debounce.cancel();
                  _debounce = Timer(const Duration(milliseconds: 3000), () {
                    // do something with _searchQuery.text
                    handleTxtBoxValue(str);
                  });
                },
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 26,
                          color: Colors.redAccent,
                        ),
                        onPressed: () {}),
                    hintText: 'Search Something',
                    hintStyle: TextStyle(fontSize: 25)),
              ),
            ),
            preferredSize: Size.fromHeight(50)),
      ),
      body: FutureBuilder(
        future: Server.getDataFromServer(searchTxt),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (snapShot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapShot.data.length,
            itemBuilder: (BuildContext c, int index) {
              return Card(
                child: ListTile(
                  leading: Image.network(
                      snapShot.data[index]['images']['original']['url']),
                  title: Text(snapShot.data[index]['title']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
