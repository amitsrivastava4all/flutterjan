import './items.dart';

class ItemOperations {
  static List<Item> fill() {
    List<Item> items = [];
    // Call firebase or call some web api
    for (int i = 0; i <= 10; i++) {
      items.add(Item('Mobile $i', ['Apple $i', 'Samsung $i']));
    }
    return items;
  }
}
