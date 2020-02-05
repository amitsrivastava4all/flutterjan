import './item.dart';

class ItemOperation {
  static List<Item> items = [];
  static List<Item> fillItem() {
    var url =
        "https://cdn4.iconfinder.com/data/icons/iphone-5s-5c/256/iPhone-5S-Gold.png";
    for (int i = 1; i <= 30; i++) {
      items.add(Item(i, "Apple $i", 9000.00 + i, i + 2, url));
    }
    return items;
  }
}
