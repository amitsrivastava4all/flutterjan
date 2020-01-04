void main(){
  int a = 100; // Explicit Type
  var b  = 200.90; // Implicit Type
  b = 1000.999;
  //b = 'Hello';
  var s = new StringBuffer(100);
  
  StringBuffer sb = new StringBuffer(100);
  String e = "Hello";
  double rr = 90.20;
  String r = e + " Ok ";

  print("A is $a");
  print("A is "+a.toString());
  print("A is ${a.runtimeType}");
  print("B is ${b.runtimeType}");
}