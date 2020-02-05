import 'package:flutter/material.dart';

import './ItemList.dart';
import './search.dart';
import '../../models/item.dart';
import '../../models/itemoperation.dart';

class ToDoApp extends StatefulWidget {
  @override
  _ToDoAppState createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  String searchData = '';
  _searchInput(str) {
    setState(() {
      searchData = str;
    });
  }

  List<Item> items;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = ItemOperation.fillItem();
  }

  @override
  Widget build(BuildContext context) {
    print("Build Called");
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: Column(
        children: <Widget>[
          SearchBox(_searchInput),
          //Text('$searchData')
          Expanded(child: ItemList(items))
        ],
      ),
    );
  }
}
