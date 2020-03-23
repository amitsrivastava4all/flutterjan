import 'package:flutter/material.dart';

class BottomNavDemo extends StatefulWidget {
  @override
  _BottomNavDemoState createState() => _BottomNavDemoState();
}

class _BottomNavDemoState extends State<BottomNavDemo> {
  int index;
  List<BottomNavigationBarItem> _getItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.account_balance,
              color: index == 0 ? Colors.orange : Colors.black),
          title: Text('Balance')),
      BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_filled,
              color: index == 1 ? Colors.orange : Colors.black),
          title: Text('Play')),
      BottomNavigationBarItem(
          icon: Icon(Icons.person,
              color: index == 2 ? Colors.orange : Colors.black),
          title: Text('Users'))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: ,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: IconButton(
          icon: Icon(
            Icons.add_a_photo,
            size: 50,
            color: Colors.red,
          ),
          onPressed: () {}),

      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },
          elevation: 5,
          items: _getItems()),
    );
  }
}
