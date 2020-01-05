import 'dart:math';
int www;
calc(z){
  
  // add(x,y){
  //   return x + y + z;
  // } 
  // sub(x,y){
  //   return x - y - z;
  // } 
  // return [add, sub];
  // return [(x,y){
  //   return x + y + z;
  //   },(x,y)=>x+y+z];
  return {"add":(x,y){
    return x + y + z;
  }, "sub":(x,y)=>x+y+z};
}
void main(){
 // var l = calc(1000);
 //List<Function> l = calc(1000);
 Map<String, Function> map = calc(1000);
//  print("Add is ${l[0](10,20)}");
//   print("Sub is ${l[1](10,20)}");
print(map["add"](10,20));
print(map["sub"](10,20));
  // loop(evenOdd);
  // loop(cube);
  // loop(table);
}
void loop(Function function){
  for(int i = 1; i<=10; i++){
    print("Result ${function(i)}");
  }
}
final evenOdd = (num)=>num%2==0?"Even $num":"Odd $num";
final cube = (num)=>pow(num, 3);
final table = (num)=>5 * num;