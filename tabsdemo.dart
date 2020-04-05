import 'package:flutter/material.dart';

import './model/itemoperations.dart';
import './model/items.dart';

class TabsDemo extends StatefulWidget {
  @override
  _TabsDemoState createState() => _TabsDemoState();
}

class _TabsDemoState extends State<TabsDemo>
    with SingleTickerProviderStateMixin {
  // Step-2
  TabController _tabController;
  List<Item> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    items = ItemOperations.fill();
  }

  _getTabOne() {
    return Container(
      child: Text(
        'Tab One',
        style: TextStyle(fontSize: 40),
      ),
    );
  }

  _getTabTwo() {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Chat From Amit', style: TextStyle(fontSize: 50)),
          subtitle: Text(
            'Hello How are U ',
            style: TextStyle(fontSize: 30),
          ),
        ),
        ListTile(
          title: Text('Chat From Ram', style: TextStyle(fontSize: 50)),
          subtitle: Text(
            'Hello How are U ',
            style: TextStyle(fontSize: 30),
          ),
        ),
        ListTile(
          title: Text('Chat From Shyam', style: TextStyle(fontSize: 50)),
          subtitle: Text(
            'Hello How are U ',
            style: TextStyle(fontSize: 30),
          ),
        ),
        ListTile(
          title: Text('Chat From Tim', style: TextStyle(fontSize: 50)),
          subtitle: Text(
            'Hello How are U ',
            style: TextStyle(fontSize: 30),
          ),
        ),
        ListTile(
          title: Text('Chat From Tom', style: TextStyle(fontSize: 50)),
          subtitle: Text(
            'Hello How are U ',
            style: TextStyle(fontSize: 30),
          ),
        ),
        ListTile(
          title: Text('Chat From Kim', style: TextStyle(fontSize: 50)),
          subtitle: Text(
            'Hello How are U ',
            style: TextStyle(fontSize: 30),
          ),
        ),
        ListTile(
          title: Text('Chat From Vim', style: TextStyle(fontSize: 50)),
          subtitle: Text(
            'Hello How are U ',
            style: TextStyle(fontSize: 30),
          ),
        )
      ],
    );
  }

  _getTabThree() {
    return Container(
      child: Card(
        elevation: 5,
        child: Text(
          'Phone Details are ',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }

  _getTabFour() {
    return Container(
      child: Card(
        elevation: 5,
        child: Text(
          'Tab4 ',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }

  _getTabFive() {
    return Container(
      child: Card(
        elevation: 5,
        child: Text(
          'Tab5 ',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }

  _getTabSix() {
    return Container(
      child: Card(
        elevation: 5,
        child: Text(
          'Tab 6 ',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }

  _createHeader() {
    return DrawerHeader(
      child: Text(
        'I am Header',
        style: TextStyle(fontSize: 30),
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, spreadRadius: 10, blurRadius: 20)
          ],
          gradient: LinearGradient(
              colors: [Colors.orangeAccent, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
    );
  }

  _createDrawerBody(String mainTitle, String subTitle, String subTitle2) {
    return ExpansionTile(
      title: Text(mainTitle),
      children: <Widget>[Text(subTitle), Text(subTitle2)],
    );
  }

  _createDrawer() {
    return Drawer(
        child: ListView.builder(
      itemBuilder: (context, i) {
        if (i == 0) {
          return _createHeader();
        }
        return _createDrawerBody(
            items[i].name, items[i].subItems[0], items[i].subItems[1]);
      },
      itemCount: items.length,
    ));
//    return Drawer(
//      child: ListView(
//        children: <Widget>[
//          _createHeader(),
//
//          //_fillDrawerBody().
//          //_createDrawerBody('Clothes', 'Shirts', 'Jeans'),
//          //_createDrawerBody('Shoes', 'Casual', 'Sports'),
//          //_createDrawerBody('Phones', 'Smart', 'Tablets')
//        ],
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _createDrawer(), // Step-1
      appBar: AppBar(
        title: Text('Tab Demo'),
        // Step - 1 Create a TabBar inside AppBar
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          labelColor: Colors.orangeAccent,
          unselectedLabelColor: Colors.tealAccent,
          tabs: <Widget>[
            Tab(
                icon: Icon(
              Icons.person,
              size: 30,
            )),
            Tab(
              icon: Icon(Icons.chat, size: 70),
            ),
            Tab(icon: Icon(Icons.phone, size: 50)),
            Tab(icon: Icon(Icons.more, size: 50)),
            Tab(icon: Icon(Icons.sync, size: 70)),
            Tab(icon: Icon(Icons.home, size: 50))
          ],
        ),
      ),
      // Step-3 TabBar Attach with Layouts
      body: TabBarView(
        children: [
          _getTabOne(),
          _getTabTwo(),
          _getTabThree(),
          _getTabFour(),
          _getTabFive(),
          _getTabSix()
        ],
        controller: _tabController,
      ),
    );
  }
}
