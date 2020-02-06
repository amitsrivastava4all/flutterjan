class Item {
  int id;
  String name;
  bool isMarked;
  DateTime date;
  Item(int id, String name) {
    this.id = id;
    this.name = name;
    this.isMarked = false;
    this.date = DateTime.now();
    // print("Cons Call ${this.date}");
  }
  @override
  String toString() {
    return "Item id is $id Name is $name and isMarked $isMarked Date is $date";
  }
}
