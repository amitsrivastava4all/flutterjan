void main(){
  //int p5 = [545,344];
  var p2 = [90,22,44,55];
  
  List<int> p1 = [10,20,30,50,999];
  p1.add(89898);
  p1.remove(0);
  p1.contains(999); // true , false
  Set ee = {10,20,10,20};
  var ggg = {100,300,400};
  print(ee);
  Map<String, List<int>> phoneMap= {"amit":[2222,3333]
  ,"ram":[5453,2222]};
  var map2 = {"amit":2222};

  Function t4 = ()=>"Hello";
  String gh = t4();
  var g2 = "Amit";
  String rr = "Hello";
  bool g1 = true;
  double r1 = 19.20;
  var e ;
  print(e); // null
  print(e.runtimeType);
  print(e.runtimeType.runtimeType);
  var a = 100; // Implicit Type
  print(a.runtimeType);
  print(a.runtimeType.runtimeType);
  //a = "Hello";
  print("Hello Dart");
  //var tt = show;
  //print(tt.runtimeType);
  int result = add(10,20);
  print("Result is $result");
  print("Adder is ${adder(90,88.2)}");
  var fatArrow =(a,b)=>a+b;
  print("Fat Arrow ${fatArrow(1000,2000)}");
  var fn = (a,b){
    print("Anonymous Function ");
    return a + b;
  };
  var res = fn(1000,3000);
  print("Res is $res");
}
void show(){
  print("I am Show ");
}
int add(int x, int y){
  return x + y;
}
adder(x,y){
  return x + y;
}