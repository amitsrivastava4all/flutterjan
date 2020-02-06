import './Item.dart';

class ItemOperations {
  static List<Item> items = [];

  static List<Item> fill() {
    items = [];
    for (int i = 1; i <= 50; i++) {
      items.add(Item(i, "Test$i"));
    }
    return items;
  }

  static bool add() {}
  static List<Item> find(String str) {
    List<Item> subList = items.where((item) => item.name == str).toList();

    print("Sub List is $subList");
    return subList;
  }

  static List<Item> deleteMarked() {
    items = items.where((item) => item.isMarked == false).toList();
    return items;
  }

  static List<Item> toggleMarked(index) {
    items[index].isMarked = !items[index].isMarked;
    return items;
  }

  static int countMarked() {
    return items.where((item) => item.isMarked).toList().length;
  }

  static List<Item> sort(bool order) {
    if (order) {
      items.sort((first, second) => first.name.compareTo(second.name));
    } else {
      items.sort((first, second) => second.name.compareTo(first.name));
    }
    return items;
  }
}
