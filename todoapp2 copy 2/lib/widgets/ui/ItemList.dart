import 'package:flutter/material.dart';

import '../../models/item.dart';

class ItemList extends StatelessWidget {
  List<Item> items;
  ItemList(List<Item> items) {
    this.items = items;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Image.network(items[index].url),
            title: Text(items[index].name),
            subtitle: Text('${items[index].price}'),
          );
        },
        itemCount: this.items.length);
  }
}
