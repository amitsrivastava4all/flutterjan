import 'dart:io';
String db(){
  // DB Talk
  //String result = "Data is ....";
  String result; // null
  return result;
}
void main(){
  int x = 100;
  x++;
  final int w  = 1000;
  //w++;
  stdout.write("Enter the String");
  String data = stdin.readLineSync();
  //w = 10000;
  final StringBuffer sb = new StringBuffer();
  sb.write(data);
  sb.write("aadsfdfsdffsf");
  print("SB is $sb");
  // const StringBuffer sb2 = new StringBuffer();
  const int y = 200;
  final int z = 900;
  String msg = db();
  //print(msg!=null?msg:'Data is Missing');
  String t = msg??'Some other value';
  print("Message is ${msg??'Data is Missing'}");
  //y++;
  String x11 = "Hello How are You";
  Set<int> sets = x11.runes.toSet();
  print("65 is "+String.fromCharCode(65)); // Ascii to String
  StringBuffer sb2 = StringBuffer();
  sets.forEach((ascii)=>sb2.write(String.fromCharCode(ascii)));
  print("Now SB2 is $sb2");
  //var ll = x11.runes.toList();
  Iterable itr = x11.runes; // get chars ascii code
  itr.forEach((e)=>print("e is $e"));
  List<int> ll = x11.runes.toList();
  print("ll is $ll");
  print(ll.runtimeType);
  var ww1 = [10,20,10,20,100,90,10];
  Set<int> set11 = ww1.toSet();
  int ff = 1000;
  double ff2 = ff.toDouble();
  print("set11 $set11");
}