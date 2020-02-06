import 'package:flutter/material.dart';

import './add.dart';
import '../models/Item.dart';
import '../models/itemoperations.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  int totalMarked = 0;
  bool sortOrder = true;

  ScrollPhysics sp = ScrollPhysics();

  List<Item> items;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init State Call ");
    items = ItemOperations.fill();
  }

  _addScreenOpen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddItem()));
  }

  _getSearchValue(str) {
    List<Item> subList = ItemOperations.find(str);

    setState(() {
      if (subList.length == 0) {
        subList = ItemOperations.fill();
      }
      items = subList;
    });
  }

  _deleteMarked() {
    List<Item> subList = ItemOperations.deleteMarked();
    print("Size is ${subList.length}");
    print("Sub List after Delete $subList ");

    setState(() {
      items = subList;
      totalMarked = ItemOperations.countMarked();
    });
  }

  _markDelete(int index) {
    List<Item> subList = ItemOperations.toggleMarked(index);
    setState(() {
      items = subList;
      totalMarked = ItemOperations.countMarked();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build Called.");
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.menu),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            Container(
              width: 20,
              margin: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                ),
                onPressed: () {
                  print("U click on Add");
                  _addScreenOpen();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 20,
              child: IconButton(
                icon: Icon(
                  Icons.delete_forever,
                ),
                onPressed: () {
                  print("Delete Marked Call");
                  _deleteMarked();
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.sort_by_alpha,
              ),
              onPressed: () {
                sortOrder = !sortOrder;
                List<Item> newList = ItemOperations.sort(sortOrder);
                setState(() {
                  items = newList;
                });
              },
            )
          ],
          elevation: 10,
          //shape: CircleBorder(),
          title: Text(
            'ToDo App',
            style: TextStyle(fontSize: 20),
          )),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: TextField(
              onChanged: (str) {
                _getSearchValue(str);
              },
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  labelText: 'Search todo',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Type to Search'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: sp,
              itemBuilder: (ctx, index) {
                return Card(
                  color: items[index].isMarked
                      ? Colors.lightGreenAccent
                      : Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Text('${items[index].id} ${items[index].name}'),
                    subtitle: Text('${items[index].date}'),
                    leading: Icon(Icons.done),
                    onTap: () {
                      print("U r on $index");
                      _markDelete(index);
                    },
                    trailing: Icon(Icons.delete, color: Colors.red),
                  ),
                );
              },
              itemCount: items == null ? 0 : items.length,
            ),
          ),
          Text(
            'Total records are ${items.length} Marked ${totalMarked} UnMarked ${items.length - totalMarked}',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
