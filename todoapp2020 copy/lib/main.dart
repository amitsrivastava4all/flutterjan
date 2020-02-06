import 'package:flutter/material.dart';

import './widgets/list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ToDoListApp',
    home: ItemList(),
  ));
}
